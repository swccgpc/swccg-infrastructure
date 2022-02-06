
variable "github_repos1" {
  description = "GitHub Repositories"
  type        = map
  default     = {
    "epicduel":          "swccgpc/epicduel", 
    "DiscordCardLinker": "swccgpc/DiscordCardLinker",     
    "holotable":         "swccgpc/holotable", 
    "holotable-website": "swccgpc/holotable-website", 
    "orgchart":          "swccgpc/orgchart",
    "swccg-card-json":   "swccgpc/swccg-card-json", 
    "swccg-playtesting": "swccgpc/swccg-playtesting",
    "swccg-scomp":       "swccgpc/swccg-scomp", 
    "swccg-vkit":        "swccgpc/swccg-vkit", 
    "swccg-vkit-images": "swccgpc/swccg-vkit-images",
    "tournament":        "swccgpc/tournament",
    "yj-scomp":          "swccgpc/yj-scomp",
    "youngjedi":         "swccgpc/youngjedi",
  }
} ## variable



variable "github_repos" {
  description = "GitHub Repositories"
  #type        = map(object({repo=string,policies=map}))
  #default     = {
  #  "DiscordCardLinker": "swccgpc/DiscordCardLinker", 
  #  "epicduel":          "swccgpc/epicduel", 
  #  "holotable":         "swccgpc/holotable", 
  #  "holotable-website": "swccgpc/holotable-website", 
  #  "orgchart":          "swccgpc/orgchart",
  #  "swccg-card-json":   "swccgpc/swccg-card-json", 
  #  "swccg-playtesting": "swccgpc/swccg-playtesting",
  #  "swccg-scomp":       "swccgpc/swccg-scomp", 
  #  "swccg-vkit":        "swccgpc/swccg-vkit", 
  #  "swccg-vkit-images": "swccgpc/swccg-vkit-images",
  #  "tournament":        "swccgpc/tournament",
  #  "yj-scomp":          "swccgpc/yj-scomp",
  #  "youngjedi":         "swccgpc/youngjedi",
  #}
} ## variable

#variable "policies" {
#  description = "Role Policies"
#  #type        = map(list(object({name=string,policy=string})))
#  type        = map(map(string))
#  #default     = {
#  #  "welcome": {"hello": "world"}
#  #} ## default
#} ## variable







module "githuboidc" {
  source       = "../../modules/aws-github-oidc"
  github_repos = var.github_repos
  github_orgs  = ["swccgpc"]
  #policies     = var.policies
} ## module





