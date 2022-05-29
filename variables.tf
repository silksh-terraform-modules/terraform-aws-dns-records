variable "records" {
  # default = {
  #   "testowy" = { value = "testowy.silksh.pl", type = "A" }
  # }
  # type = map
  default = ""
}

variable "tld" {
  default = ""
  type    = string
}

variable "is_private_zone" {
  default = false
}