variable "token" {
  description = "Yandex Cloud security OAuth token"
  default     = "nope" #generate yours by this https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID where resources will be created"
  default     = "enter your folder id"
}

variable "cloud_id" {
  description = "Yandex Cloud ID where resources will be created"
  default     = "there is cloud id"
}

variable "public_key_path" {
  description = "Path to ssh public key, which would be used to access workers"
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  description = "Path to ssh private key, which would be used to access workers"
  default     = "~/.ssh/id_rsa"
}

variable "zone_id_a" {
  type = string
  default = "ru-central1-a"
}

variable "zone_id_b" {
  type = string
  default = "ru-central1-b"
}

variable "zone_id_c" {
  type = string
  default = "ru-central1-c"
}

variable "zone_id" {
  type = string
  default = "ru-central1-a"
}
variable "user" {
  type = string
  default = "yc-user"
}
