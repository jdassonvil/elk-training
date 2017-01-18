resource "openstack_networking_secgroup_v2" "elk-secgroup" {                                                           
   name = "elk-secgroup"                                                                                               
   description = "ELK training security group"                                                                                   
}  

resource "openstack_networking_secgroup_rule_v2" "in-22" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 22
  port_range_max = 22
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.elk-secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "in-5000" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 5000
  port_range_max = 5000
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.elk-secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "in-5601" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 5601
  port_range_max = 5601
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.elk-secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "in-9200" {
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 9200
  port_range_max = 9200
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.elk-secgroup.id}"
}
