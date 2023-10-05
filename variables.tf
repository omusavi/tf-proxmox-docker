variable "proxmox_url" {
  type        = string
  description = "API URL for the proxmox node (URL and Port only)"
}

variable "proxmox_user" {
  type        = string
  description = "Username for the proxmox node"
}

variable "proxmox_password" {
  type        = string
  description = "Password for the proxmox node"
  sensitive   = true
}

variable "node_name" {
  type        = string
  description = "Name of the proxmox node to store files on"
}

variable "image_path" {
  type        = string
  description = "Paths to the image to download"
  default     = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}
