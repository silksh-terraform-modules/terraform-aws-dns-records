variable "records" {
  # Klucz mapy = nazwa rekordu DNS (logika "@..." bez zmian).
  # Ten sam hostname, różne typy — osobne klucze (sufiks |TYP opcjonalny):
  #   "old"     = { value = ["1.2.3.4"], type = "A" }
  #   "old|TXT" = { value = ["abc..."], type = "TXT" }
  default = ""
}

variable "tld" {
  default = ""
  type    = string
}

variable "vpc_id" {
  default = null
}