variable "records" {
  # Klucz mapy = nazwa rekordu DNS (logika "@..." bez zmian).
  #
  # Jeden rekord pod kluczem:
  #   "old" = { value = ["1.2.3.4"], type = "A" }
  #
  # Ta sama nazwa DNS, różne typy (nie da się dwóch kluczy "old" w mapie — użyj listy):
  #   "old" = [
  #     { value = ["1.2.3.4"], type = "A" },
  #     { value = ["abc..."], type = "TXT" },
  #   ]
  #
  # Albo osobne klucze z sufiksem |TYP (opcjonalnie):
  #   "old|A"   = { value = ["1.2.3.4"], type = "A" }
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