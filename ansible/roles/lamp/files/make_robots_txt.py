#!/usr/bin/env python3


allow_bots = [
  "Googlebot",
  "Googlebot-Image",
  "MSNBot",
  "bingbot",
  "Amazonbot",
]

disallow_bots = [
  "ZoominfoBot",
  "SemrushBot",
  "MJ12bot",
  "Twitterbot",
  "SeznamBot",
  "LinuxGetUrl",
  "Krzana bot",
  "AhrefsBot",
  "PaperLiBot",
  "ZoomBot",
  "magpie-crawler",
  "linkbot",
  "Applebot",
  "The Knowledge AI",
  "MauiBot",
  "Buck",
  "TkBot",
  "coccocbot-web",
  "YandexBot",
  "UptimeRobot",
  "ltx71",
  "DotBot",
]


sites = [
  "store.starwarsccg.org",
  "forum.starwarsccg.org",
  "www.starwarsccg.org",
]

print("")
print("Writing robots.txt files:")

for site in sites:
  print("  * "+site)
  fh = open(site + "/robots.txt", "w")

  for bot in allow_bots:
    fh.write("User-Agent: "+bot+"\n")
    fh.write("Allow: /\n")

  for bot in disallow_bots:
    fh.write("User-Agent: "+bot+"\n")
    fh.write("Disallow: /\n")

  fh.write("User-Agent: *\n")
  fh.write("Disallow: /\n")

  fh.close

print("")