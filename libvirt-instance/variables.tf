variable "name" {
  description = "Name to be used on instance created"
  type        = string
}

variable "memory" {
  description = "The amount of memory in MiB. If not specified the domain will be created with 512 MiB of memory be used"
  type        = number
  default     = 512
}

variable "vcpu" {
  description = "The amount of virtual CPUs. If not specified, a single CPU will be created"
  type        = number
  default     = 1
}

variable "autostart" {
  description = "Whether instance will be auto started or not"
  type        = bool
  default     = true
}

variable "network_interface" {
  description = "Customize network interfaces to be attached at instance boot time"
  type        = list(map(string))
  default     = []
}

variable "graphics_type" {
  description = "Type of graphics emulation. spice | vnc"
  type        = string
  default     = "vnc"
}

variable "root_volume_id" {
  description = "ID of root volume if already exist"
  type        = string
  default     = ""
}

variable "base_volume_id" {
  description = "ID of base OS image if already exist"
  type        = any
  default     = ""
}

variable "cloud_image" {
  description = "Cloud image path/url to provision instance"
  type        = string
  default     = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
}

variable "volume_size" {
  description = "The size of the volume in GB"
  type        = number
  default     = 8
}

variable "pool_name" {
  description = "Name of pool where all volumes will stored"
  type        = string
  default     = "default"
}

variable "user_data" {
  description = "Cloud-init user data"
  type        = string
  default     = ""
}

variable "filesystem" {
  description = "Sharing filesystem between libvirt host and guest"
  type        = list(map(any))
  default     = []
}

variable "network_config" {
  description = "Cloud-init network config"
  type        = string
  default     = ""
}
