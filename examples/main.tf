module "dns_records" {
  source = "github.com/silksh-terraform-modules/terraform-aws-dns-records?ref=v0.0.1"
  
  tld = "example.com" # littletestingdomain.xyz

  ## records that relate directly to the main domain name
  ## start with "@" and complete with any string
  ## this name is not taken into account when creating the record

  records = {  
    "cname" = { value = ["somevalue.anotherdomain.com"], type = "CNAME" },
    "@some_record" = { value = ["123.123.123.123"], type = "A" },
    "www" = { value = ["example.com"], type = "CNAME" },
    "@spf" = { value = ["v=spf1 include:amazonses.com ~all"], type = "TXT" },
    "@mx" = { value = ["1 ASPMX.L.GOOGLE.COM","5 ALT1.ASPMX.L.GOOGLE.COM","5 ALT2.ASPMX.L.GOOGLE.COM","10 ALT3.ASPMX.L.GOOGLE.COM","10 ALT4.ASPMX.L.GOOGLE.COM", "15 4hhyiqf3p45zrr7rabyh5jfvb62yf27dhvemegti7qnbye7ehodq.mx-verification.google.com"], type = "MX" },
    "google._domainkey" = { value = ["v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsDfy//mIZiKL6NcDK5tiCH1iR0bgutXNUqYevkeze12n3L7NfpYKV9gxFk88fGMfMRi3Tiod/LCL3+3EaEJmbCbr3IE3Xw\"\"m8LjrZjQaYl1pKYSwexKat/UkPoC8IRBqncSZfLXQn5RWp6s9AikxcvMCiAk4hsguwIFgRku5teoYn1DAsIdJ9foxgTqg3WLqv4+mSyraSV76Pzs4oysLBP/I9uzdrrZPl1CyQ+wElxKzpicFgE4lzTK2Wi+S/fPCmR+g0TLfwIaO3BvTUX/6zVleER9WQ2fDRIGIWfzOeD0zvR+iNLw2i9GTMTFuM5fi/p/luJak4AAzrTxzbpi62JwIDAQAB"], type = "TXT" }
  }
}