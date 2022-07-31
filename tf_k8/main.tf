terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
   backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tf-netology-bucket"
    region     = "ru-central1-a"
    key        = "diplom/terraform.tfstate"
    access_key = "XXXXXXXXXXXXXXXXXXX"
    secret_key = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"

    skip_region_validation      = true
    skip_credentials_validation = true
  } 
}

provider "yandex" {
  token = var.token
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  zone = var.zone_id
}

resource "yandex_vpc_network" "netology-network-tf" {
  name = "netology-tf"
}




 resource "yandex_vpc_subnet" "private_a" {
   name = "netology-tf-private_a"
   v4_cidr_blocks = ["192.168.20.0/24"]
   zone           = var.zone_id_a
   network_id     = yandex_vpc_network.netology-network-tf.id
   depends_on = [
    yandex_vpc_network.netology-network-tf,
  ]
  }

  resource "yandex_vpc_subnet" "private_b" {
   name = "netology-tf-private_b"
   v4_cidr_blocks = ["192.168.21.0/24"]
   zone           = var.zone_id_b
   network_id     = yandex_vpc_network.netology-network-tf.id
   depends_on = [
    yandex_vpc_network.netology-network-tf,
  ]
  }

   resource "yandex_vpc_subnet" "private_c" {
   name = "netology-tf-private_c"
   v4_cidr_blocks = ["192.168.22.0/24"]
   zone           = var.zone_id_c
   network_id     = yandex_vpc_network.netology-network-tf.id
   depends_on = [
    yandex_vpc_network.netology-network-tf,
  ]
  }



resource "yandex_compute_instance" "netology-vm-cp" {
  name        = "k8-cp-${terraform.workspace}"
  platform_id = "standard-v1"
  zone        = var.zone_id_a

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8anitv6eua45627i0e"
      size = 30
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.private_a.id
    ip_address = "192.168.20.10"
    nat       = true
  }

  metadata = {
    ssh-keys = "myuser:${file(var.public_key_path)}"
  }
}

resource "yandex_compute_instance" "netology-vm-n1" {
  name        = "k8-n1-${terraform.workspace}"
  platform_id = "standard-v1"
  zone        = var.zone_id_a

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8anitv6eua45627i0e"
      size = 30
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.private_a.id
    ip_address = "192.168.20.11"
    nat       = true
  }

  metadata = {
    ssh-keys = "myuser:${file(var.public_key_path)}"
  }
}
resource "yandex_compute_instance" "netology-vm-n2" {
  name        = "k8-n2-${terraform.workspace}"
  platform_id = "standard-v1"
  zone        = var.zone_id_a

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8anitv6eua45627i0e"
      size = 30
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.private_a.id
    ip_address = "192.168.20.12"
    nat       = true
  }

  metadata = {
    ssh-keys = "myuser:${file(var.public_key_path)}"
  }
}
resource "yandex_compute_instance" "netology-vm-n3" {
  name        = "k8-n3-${terraform.workspace}"
  platform_id = "standard-v1"
  zone        = var.zone_id_a

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8anitv6eua45627i0e"
      size = 30
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.private_a.id
    ip_address = "192.168.20.13"
    nat       = true
  }

  metadata = {
    ssh-keys = "myuser:${file(var.public_key_path)}"
  }
}