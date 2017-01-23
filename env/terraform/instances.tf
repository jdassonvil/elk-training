variable "instance-count" {
  type    = "string"
  default = "12"
}

resource "openstack_compute_floatingip_v2" "elk-fip" {
  count = "${var.instance-count}"
  pool = "public-floating-601"
}

resource "openstack_compute_instance_v2" "elk-instance" {
  count = "${var.instance-count}"
  name = "elk-training-${count.index}"
  image_name = "CentOS-7"
  flavor_name = "GP2-Medium"
  key_pair = "elk-training"
  security_groups = ["elk-secgroup"]
  floating_ip = "${element(openstack_compute_floatingip_v2.elk-fip.*.address, count.index)}"

 connection {                                                                                                          
   type = "ssh"                                                                                                        
   user = "cloud-user"                                                                                                 
   private_key = "${file("elk-training.pem")}"                                                                               
 }

  provisioner "file" {
    source = "../salt"
    destination = "/home/cloud-user"
  }

  provisioner "remote-exec" {                                                                                           
  inline = [                                                                                                          
     "sudo mkdir -p /etc/salt",
     "sudo mv /home/cloud-user/salt/etc/minion /etc/salt/minion",
     "sudo mkdir -p /srv/salt",
     "sudo mv /home/cloud-user/salt/roots/* /srv/salt",
     "rm -rf /home/cloud-user/salt",
     "sudo curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com",
     "sudo sh bootstrap-salt.sh",
     "sudo salt-call state.apply",
     "sudo usermod -G docker cloud-user",
   ]                                                                                                                   
  }                                                                                                                     
}
