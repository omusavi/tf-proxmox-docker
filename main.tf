terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.32.0"
    }
  }
}

provider "proxmox" {
  endpoint = "https://${var.proxmox_url}/"
  username = var.proxmox_user
  password = var.proxmox_password
  insecure = true
}

resource "proxmox_virtual_environment_file" "image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.node_name

  source_file {
    path      = var.image_path
    file_name = basename(var.image_path)
  }

  lifecycle {
    ignore_changes = [source_file[0].changed]
  }

  timeout_upload = "300"
}
