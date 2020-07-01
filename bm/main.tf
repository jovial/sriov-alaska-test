resource "openstack_compute_instance_v2" "bm_test" {
  name            = var.name
  image_name      = "CentOS7.8-OFED5.0"
  flavor_name     = "compute-A"
  key_pair        = "ilab_sclt100"
  config_drive    = true

  network {
    name = "ilab"
  }

  network {
    name = "p3-lln"
  }

  network {
    name = "p3-bdn"
  }
}