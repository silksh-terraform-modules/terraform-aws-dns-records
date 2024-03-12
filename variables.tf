variable "records" {
  # default = {
  #   "ttl" = { value = "ttl.example.com", type = "CNAME", ttl = "3600"}
  #   "example" = { value = "1.1.1.1", type = "A"}
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