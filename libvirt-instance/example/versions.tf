terraform {
  required_version = ">= 0.13.1"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = ">= 0.7"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
  # uri = "qemu+ssh://user@172.16.1.10/system"
}
