variable "resource_group_name" {
  default = "kubernetes"
}

variable "vnet_name" {
    default = "kubernetes-vnet"
}

variable "vnet_cidr" {
    default = ["10.240.0.0/16"]
}

variable "subnet1_cidr" {
    defualt = ["10.240.0.0/24"]
}

variable "env_tag" {
  default = "test"
}