resource "network" "lab_net" {
  subnet = "10.200.0.0/24"
}

resource "vm" "ubuntu" {
  image {
    name = "europe-west1-docker.pkg.dev/instruqt/instruqt-sandbox/ubuntu-2204:latest"
  }

  resources {
    cpu    = 2
    memory = 2048
  }

  network {
    id         = resource.network.lab_net.meta.id
    ip_address = "10.200.0.10"
  }

  health_check {
    timeout = "120s"

    exec {
      script = <<-EOF
        #!/bin/sh -e
        test -f /tmp/instruqt-startup-marker
      EOF
    }
  }

  startup_script = <<-EOT
    #!/bin/sh
    echo "vm-ready" > /tmp/instruqt-startup-marker
  EOT
}

resource "container" "shell" {
  image {
    name = "alpine:latest"
  }

  command = ["sleep", "3600"]

  network {
    id         = resource.network.lab_net.meta.id
    ip_address = "10.200.0.20"
  }
}
