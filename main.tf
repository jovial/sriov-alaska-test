provider "openstack" {
  # use environment variables
}

module "server1" {
  source = "./sriov"
  name = "sriov-test1"
}

# module "server2" {
#   source = "./sriov"
#   name = "sriov-test2"
# }

module "server2" {
  source = "./bm"
  name = "wjs-baremetal-sriov-test1"
}