
resource "yandex_iam_service_account" "netology-sa" {
  folder_id = var.folder_id
  name      = "tf-netology-sa"
}

resource "yandex_resourcemanager_folder_iam_member" "netology-sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.netology-sa.id}"
}

resource "yandex_resourcemanager_folder_iam_binding" "admin-account-iam" {
  folder_id   = var.folder_id
  role        = "editor"
  members     = [
    "serviceAccount:${yandex_iam_service_account.netology-sa.id}",
  ]
  depends_on = [
    yandex_iam_service_account.netology-sa,
  ]
}


// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.netology-sa.id
  depends_on = [
    yandex_iam_service_account.netology-sa,
  ]
  description        = "static access key for object storage"
}

// Use keys to create bucket
resource "yandex_storage_bucket" "netology-bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = "tf-netology-bucket"
}



resource "yandex_container_registry" "nt-reg" {
  name = "nt-registry"
  folder_id   = var.folder_id
  labels = {
    my-label = "nt-label-value"
  }
}

