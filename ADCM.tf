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

output "internal_ip_address_novoselovdy-adcm-terraform" {
  value = yandex_compute_instance.novoselovdy-adcm-terraform.network_interface.0.ip_address
}

output "external_ip_address_novoselovdy-adcm-terraform" {
  value = yandex_compute_instance.novoselovdy-adcm-terraform.network_interface.0.nat_ip_address
}
