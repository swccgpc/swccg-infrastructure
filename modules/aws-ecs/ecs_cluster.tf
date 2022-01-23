
resource "aws_ecs_cluster" "swccg" {
  name = "swccg"

  capacity_providers = ["FARGATE_SPOT", "FARGATE"]
  default_capacity_provider_strategy {
    capacity_provider="FARGATE"
    weight           =1
    base             =0
  }
  default_capacity_provider_strategy {
    capacity_provider="FARGATE_SPOT"
    weight           =2
    base             =0
  }

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

} ## resource aws_ecs_cluster swccg

