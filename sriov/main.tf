data "openstack_networking_network_v2" "bdn" {
  name = "p3-bdn"
}

data "openstack_networking_network_v2" "lln" {
  name = "p3-lln"
}

resource "openstack_networking_port_v2" "sriov_bdn" {
  name           = "bdn-${var.name}"
  network_id     = data.openstack_networking_network_v2.bdn.id
  admin_state_up = "true"
  binding {
    vnic_type = "direct"
  }
}

# resource "openstack_networking_port_v2" "sriov_lln" {
#   name           = "lln-${var.name}"
#   network_id     = data.openstack_networking_network_v2.lln.id
#   admin_state_up = "true"
#   binding {
#     vnic_type = "direct"
#   }
# }

resource "openstack_compute_instance_v2" "sriov_test" {
  name            = var.name
  image_name      = "CentOS7.8-OFED5.0"
  flavor_name     = "general.v1.tiny"
  key_pair        = "ilab_sclt100"
  config_drive    = true

  network {
    name = "ilab"
  }

  # network {
  #   port = openstack_networking_port_v2.sriov_lln.id
  # }

  network {
    port = openstack_networking_port_v2.sriov_bdn.id
  }
}