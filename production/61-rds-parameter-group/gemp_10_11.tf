module "gemp_db_parameter_group_10_11" {
  source = "../../modules/aws-rds/modules/db_parameter_group"

  create          = true
  identifier      = "prod-gemp"
  name            = ""
  description     = "prod-gemp MariaDB 10.11"
  name_prefix     = "prod-gemp-"
  use_name_prefix = true
  family          = "mariadb10.11"

  parameters = [{
    name  = "character_set_client"
    value = "utf8"
  },{
    name  = "character_set_server"
    value = "utf8"
  }]

  tags = {
    Name        = "prod-gemp"
    Environment = "prod"
    Application = "gemp"
    Region      = "useast2"
  }
}

module "gemp_db_option_group_10_11" {
  source = "../../modules/aws-rds/modules/db_option_group"

  create                   = true
  identifier               = "prod-gemp"
  name_prefix              = "prod-gemp-"
  option_group_description = "prod-gemp MariaDB 10.11"
  engine_name              = "mariadb"
  major_engine_version     = "10.11"

  options = [{
    option_name     = "MARIADB_AUDIT_PLUGIN"
    option_settings = [{
      name  = "SERVER_AUDIT_EVENTS"
      value = "CONNECT"
    },{
      name  = "SERVER_AUDIT_FILE_ROTATIONS"
      value = "37"
    }]
  }]

  timeouts = {delete = "15m"}

  tags = {
    Name        = "prod-gemp"
    Environment = "prod"
    Application = "gemp"
    Region      = "useast2"
  }
}


