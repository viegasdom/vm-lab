


resource "vm" "ubuntu" {
  image {
    name = "europe-west1-docker.pkg.dev/instruqt/instruqt-sandbox/ubuntu-2204:latest"
  }
  startup_script = "#!/bin/sh\necho \"vm-ready\" > /tmp/instruqt-startup-marker\n"
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
  }
}
