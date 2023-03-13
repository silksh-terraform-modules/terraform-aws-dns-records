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

variable "vpc_id" {
  default = null
}