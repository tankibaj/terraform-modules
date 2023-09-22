locals {
  volume_size = var.volume_size * 1073741824 # Convert Gigabyte to Byte
}

resource "libvirt_cloudinit_disk" "this" {
  count          = var.user_data == "" ? 0 : 1
  name           = "${var.name}-cloudinit.iso"
  user_data      = var.user_data
  network_config = var.network_config
  pool           = var.pool_name
}

resource "libvirt_volume" "base_volume" {
  count  = var.base_volume_id == "" ? 1 : 0
  name   = "${var.name}-base"
  pool   = var.pool_name
  source = var.cloud_image
  format = "qcow2"
}

resource "libvirt_volume" "root_volume" {
  count          = var.root_volume_id == "" ? 1 : 0
  name           = "${var.name}-root"
  base_volume_id = var.base_volume_id == "" ? libvirt_volume.base_volume[0].id : var.base_volume_id
  pool           = var.pool_name
  size           = local.volume_size
}

resource "libvirt_domain" "this" {
  name      = var.name
  memory    = var.memory
  vcpu      = var.vcpu
  autostart = var.autostart

  dynamic "network_interface" {
    for_each = var.network_interface
    content {
      network_name   = lookup(network_interface.value, "network_name", null)
      wait_for_lease = lookup(network_interface.value, "network_wait_for_lease", false)
    }
  }

  disk {
    volume_id = var.root_volume_id == "" ? libvirt_volume.root_volume[0].id : var.root_volume_id
  }

  cloudinit = var.user_data != "" ? libvirt_cloudinit_disk.this[0].id : null

  dynamic "filesystem" {
    for_each = var.filesystem
    content {
      source   = lookup(filesystem.value, "source", null)
      target   = lookup(filesystem.value, "target", null)
      readonly = lookup(filesystem.value, "readonly", true)
    }
  }

  cpu = {
    mode = "host-passthrough"
  }

  graphics {
    type           = var.graphics_type
    listen_type    = "address"
    listen_address = "0.0.0.0"
    autoport       = true
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  lifecycle {
    ignore_changes = [network_interface]
  }
}
