
resource "null_resource" "echo_ami_id" {

  provisioner "local-exec" {
    command = "echo 'ami: ${local.ami_id}'"
  }

}
