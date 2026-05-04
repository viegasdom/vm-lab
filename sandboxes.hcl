




resource "vm" "ubuntu" {
  image {
    name = "europe-west1-docker.pkg.dev/instruqt/instruqt-sandbox/ubuntu-2204:latest"
  }
  environment = {
    "ROLE" = "beta"
  }
  startup_script = "#!/bin/sh\necho \"$${ROLE}-ok\" > /tmp/instruqt-startup-marker\n"
  config {
  }
  network {
    id         = resource.network.lab_net.meta.id
    ip_address = "10.200.0.10"
  }
  resources {
    cpu    = 2
    memory = 2048
  }
  health_check {
    timeout = "120s"
    tcp {
      address = "10.200.0.10:22"
    }
    exec {
      script = "#!/bin/sh -e\ntest -f /tmp/instruqt-startup-marker\nsystemctl is-active --quiet ssh"
    }
  }
}
