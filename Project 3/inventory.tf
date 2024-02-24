resource "local_file" "ip_address" {
   # input the path of the host inventory file. 
    filename = "/home/vagrant/terraform-ansible-project/ansible/host-inventory"
    content  = <<EOT
    [app]
    ${aws_instance.app-server.public_ip}

    [db]
    ${aws_instance.db-server.public_ip}

        EOT
}