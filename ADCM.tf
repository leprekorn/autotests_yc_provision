variable "token" {
     type = string
 }

variable "image-id" {
     type = string
 }

variable "cloud_id" {
     type = string
 }

variable "folder_id" {
     type = string
 }

variable "subnet_id" {
     type = string
 }

variable "image_folder" {
     type = string
 }

variable "zone" {
     type = string
 }

variable "platform_id" {
     type = string
 }

terraform {
   required_providers {
     yandex = {
       source = "yandex-cloud/yandex"
     }
   }
 }

 provider "yandex" {
   token     = var.token
   cloud_id  = var.cloud_id
   folder_id = var.folder_id
   zone      = var.zone
 }

resource "yandex_compute_instance" "novoselovdy-adcm-terraform" {
  name        = "novoselovdy-adcm-terraform"
  platform_id = var.platform_id
  zone        = var.zone
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = var.image-id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}
