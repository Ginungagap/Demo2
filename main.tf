provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
}

resource "google_compute_instance" "production" {
 name         = "production"
 machine_type = var.machine_type
 zone         = var.zone
 tags         = ["prod-8081", "http-server"]

  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  metadata = {
    ssh-keys = "jenkins:${file(var.public_key_path)}"
  }

  network_interface {
    network = var.network
    network_ip = var.network_ip
    access_config {
    }
  }
}

resource "google_compute_instance" "mongo-db" {
 name         = "mongo-db"
 machine_type = var.machine_type
 zone         = var.zone
 tags         = ["mongo-db-27017"]

  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  metadata = {
    ssh-keys = "jenkins:${file(var.public_key_path)}"
  }
  
  network_interface {
    network = var.network
    network_ip = var.network_ip
    access_config {
    }
  }
}
