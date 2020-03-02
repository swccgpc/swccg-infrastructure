

data "template_file" "userdata" {
  template = "${file("${path.module}/userdata.yaml")}"
  vars = {
    hostname = local.hostname
  }
}


