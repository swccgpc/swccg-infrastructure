#
# aws \
#   --profile=swccg-production \
#   rds describe-db-engine-versions \
#   --engine='mariadb' | \
#   jq '.DBEngineVersions[] | "\(.DBParameterGroupFamily) \(.EngineVersion) \(.DBEngineVersionDescription)"'
#
# DBEngineVersion  DBParameterGroupFamily Engine  DBEngineVersionDescription
# mariadb10.3      10.3.20                MariaDB 10.3.20
# mariadb10.6      10.6.7                 MariaDB 10.6.7
#


module "rds" {
  source            = "../../modules/aws-rds"

  engine            = "mariadb"
  engine_version    = "10.6.7"
  instance_class    = "db.t2.large"
  allocated_storage = 10

  identifier        = "prod-web"
  username          = var.rds_username
  password          = var.rds_password
  port              = "3306"

  vpc_security_group_ids = [data.terraform_remote_state.web.outputs.security_group_web_id]
  vpc_id                 = data.terraform_remote_state.vpc.outputs.vpc_id

  maintenance_window     = "Mon:00:00-Mon:03:00"
  backup_window          = "03:00-06:00"

  monitoring_interval    = "0" # "30"
  monitoring_role_name   = "RDSMonitoring"
  create_monitoring_role = true

  tags = {
    Name        = "swccg-web"
    Environment = "prod"
    Application = "web"
    Region      = "useast2"
  }

  # DB subnet group
  subnet_ids = [data.terraform_remote_state.vpc.outputs.aws_subnet_trust1_id,
                data.terraform_remote_state.vpc.outputs.aws_subnet_trust2_id,
                data.terraform_remote_state.vpc.outputs.aws_subnet_trust3_id]

  # DB parameter group
  family = "mariadb10.6"

  # DB option group
  major_engine_version = "10.6"

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "swccg-web"

  # Database Deletion Protection
  deletion_protection = true

  parameters = [{
    name  = "character_set_client"
    value = "utf8"
  },{
    name  = "character_set_server"
    value = "utf8"
  }]

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


} ## module rds









