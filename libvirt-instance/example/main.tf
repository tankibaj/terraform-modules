locals {
  name       = "sandbox"
  user_name  = "ubuntu"
  password   = "password"
  gateway    = "172.16.100.1"
  ip_address = "172.16.100.67/24"
}

resource "libvirt_pool" "this" {
  name = "default"
  type = "dir"
  path = "/vms/pool" # -- "/var/lib/libvirt/pool"
}

resource "libvirt_network" "bridge" {
  name      = "public"
  mode      = "bridge"
  bridge    = "br0"
  autostart = true
}

resource "libvirt_network" "nat" {
  name      = "private"
  domain    = "private.local"
  mode      = "nat"
  addresses = ["10.0.0.0/24"]
  dhcp {
    enabled = true
  }
  dns {
    enabled = true
  }
  autostart = true
}

module "sandbox" {
  source = "../"

  name   = local.name
  memory = 8192
  vcpu   = 10

  volume_size = 50
  cloud_image = "https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.img"
  pool_name   = "default"

  network_interface = [
    {
      network_name = libvirt_network.bridge.name
    },
    {
      network_name = libvirt_network.nat.name
    }
  ]

  user_data      = templatefile("${path.module}/user-data.yaml", { HOST_NAME = local.name, USERNAME = local.user_name, PASSWORD = local.password })
  network_config = templatefile("${path.module}/network-config.yaml", { IP_ADDRESS = local.ip_address, GATEWAY = local.gateway })

  depends_on = [libvirt_pool.this, libvirt_network.nat, libvirt_network.bridge]
}
