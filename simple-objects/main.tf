resource "openstack_compute_keypair_v2" "kp_adminuser" {
  name       = "kp_adminuser"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLOH1KvssMlw6fMGO9XGfq+fiPjQkyBnXM5fVcBuHuAMRMxJNomdNpjps0gjypA3RNFgdoTi2fDSa7oG2k2fCLPCFbcXArOw7hgffHXaGlZmJzOxL8TtZrkwKo4z1UEunmaJ5gHAXTrl8KH+dmq0mrZYsit0SIouast5FDDF6kCASzgxr0Jz4gfwKBH03tBvDiSSpmMg1VgF6EFJwtGYk6JHt0lgYbj9RkBDhl3zyDL67YZuBfuCR5JXpAOKjXEtTZdfezFIqhH/iCCreDPct4I78p0sRUaduSmh/hL0UJ4tC2NoDuMfoIXJqwsFSRcgslh/UmQEY2TgoFcjKvS69Z"
}

resource "openstack_compute_secgroup_v2" "sg_control" {
  name        = "sg_control"
  description = "Allow inboud SSH and SNMP"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 161
    to_port     = 161
    ip_protocol = "udp"
    cidr        = "0.0.0.0/0"
  }
}
