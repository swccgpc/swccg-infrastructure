##
## Any ALIAS records should be created with their specific resource.
## Only list static elements like A, CNAME, TXT, MX, etc. here
##


starwarsccg_org_dns_entries = {

  "ses": {"name": "_amazonses", "type": "TXT", "ttl": "300", "records": ["XosYpmtyepsZc4aCGFMA7Uyj4ynJEqHpnuVKLM8TFO8="]},

  "domainkey_ses1": {"name": "j65ymxjipx4ybipr7hw2ojev5djstipo._domainkey", "type": "CNAME", "ttl": "300", "records": ["j65ymxjipx4ybipr7hw2ojev5djstipo.dkim.amazonses.com"]},
  "domainkey_ses2": {"name": "mbrpjdqstutsq7jd6mmh7pszey4bwuqj._domainkey", "type": "CNAME", "ttl": "300", "records": ["mbrpjdqstutsq7jd6mmh7pszey4bwuqj.dkim.amazonses.com"]},
  "domainkey_ses3": {"name": "yzzjgfax3e7gcr6cfjtkjyrmqua4xpi3._domainkey", "type": "CNAME", "ttl": "300", "records": ["yzzjgfax3e7gcr6cfjtkjyrmqua4xpi3.dkim.amazonses.com"]},

  "acm_store": {"name": "_576897af2de67119db2107c8cb12037a.store", "type": "CNAME", "ttl": "300", "records": ["_ee1dbdd97564b84f97c5097654242e04.vhzmpjdqfx.acm-validations.aws"]},
  "acm_www":   {"name": "_0fd3779a6a13cb7ce5a7f7a529a6da21.www",   "type": "CNAME", "ttl": "300", "records": ["_7c93cc32144bbd330f1c3417a74bd545.vhzmpjdqfx.acm-validations.aws"]},
  "acm_forum": {"name": "_d9583d7f2f35143973a089b64fadebf3.forum", "type": "CNAME", "ttl": "300", "records": ["_8eacfc253d04d3f85e93fe905e1cfd15.vhzmpjdqfx.acm-validations.aws"]},
  "acm":       {"name": "_ec23f7441a123d9d879eb00de4ad8477",       "type": "CNAME", "ttl": "300", "records": ["_189beeffe393938abcbcd70789c309c8.vhzmpjdqfx.acm-validations.aws"]},

  "calendar": {"name": "calendar", "type": "CNAME", "ttl": "300", "records": ["ghs.googlehosted.com"]},
  "docs":     {"name": "docs",     "type": "CNAME", "ttl": "300", "records": ["ghs.googlehosted.com"]},
  "sites":    {"name": "sites",    "type": "CNAME", "ttl": "300", "records": ["ghs.googlehosted.com"]},
  "start":    {"name": "start",    "type": "CNAME", "ttl": "300", "records": ["ghs.googlehosted.com"]},

  "gemp": {"name": "gemp",           "type": "A",     "ttl": "300", "records": ["3.12.203.187"]},
  "game": {"name": "game",           "type": "CNAME", "ttl": "300", "records": ["gemp.starwarsccg.org"]},
  "play": {"name": "play",           "type": "CNAME", "ttl": "300", "records": ["gemp.starwarsccg.org"]},

  "ssh": {"name": "ssh",            "type": "A",     "ttl": "300", "records": ["75.119.211.67"]},

  "mx": {"name": "", "type": "MX", "ttl": "300", "records":["10 ASPMX.L.GOOGLE.COM",
                                                            "20 ALT1.ASPMX.L.GOOGLE.COM",
                                                            "20 ALT2.ASPMX.L.GOOGLE.COM",
                                                            "30 ASPMX2.GOOGLEMAIL.COM",
                                                            "30 ASPMX3.GOOGLEMAIL.COM",
                                                            "30 ASPMX4.GOOGLEMAIL.COM",
                                                            "30 ASPMX5.GOOGLEMAIL.COM"]},
  "spf": {"name": "", "type": "TXT", "ttl": "300", "records":["v=spf1 mx include:netblocks.dreamhost.com include:spf1.mailchannels.net include:spf2.mailchannels.net -all"]}

}





swccg_org_dns_entries = {
  "mail": {"name": "mail",     "type": "CNAME", "ttl": "300", "records": ["ghs.googlehosted.com"]},

  "mx": {"name": "", "type": "MX", "ttl": "300", "records":["10 ASPMX.L.GOOGLE.COM",
                                                       "20 ALT1.ASPMX.L.GOOGLE.COM",
                                                       "20 ALT2.ASPMX.L.GOOGLE.COM",
                                                       "30 ASPMX2.GOOGLEMAIL.COM",
                                                       "30 ASPMX3.GOOGLEMAIL.COM",
                                                       "30 ASPMX4.GOOGLEMAIL.COM",
                                                       "30 ASPMX5.GOOGLEMAIL.COM"]},
  "spf": {"name": "", "type": "TXT", "ttl": "300", "records":["v=spf1 mx include:netblocks.dreamhost.com include:spf1.mailchannels.net include:spf2.mailchannels.net -all"]}
}


swccgpc_com_dns_entries = {
}

swwork_org_dns_entries = {
}


swccgmarket_com_dns_entries = {
}


decktech_net_dns_entries = {
}


