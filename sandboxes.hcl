resource "vm" "ubuntu" {
  image {
    name = "europe-west1-docker.pkg.dev/instruqt/instruqt-sandbox/ubuntu-2204:latest"
  }
  environment = {
    "ROLE" = "ubuntu"
  }
  startup_script = <<-EOT
  #!/bin/sh
  echo "$${ROLE}-ok" > /tmp/instruqt-startup-marker
EOT
  config {}
  network {
    id         = resource.network.lab_net.meta.id
    ip_address = "10.200.0.10"
  }
  resources {
    cpu    = 2
    memory = 2048
  }
}

resource "vm" "debian" {
  image {
    name = "europe-west1-docker.pkg.dev/instruqt/instruqt-sandbox/debian-12:latest"
  }
  environment = {
    "ROLE" = "debian"
  }
  startup_script = <<-EOT
  #!/bin/sh
  echo "$${ROLE}-ok" > /tmp/instruqt-startup-marker
EOT
  config {}
  network {
    id         = resource.network.lab_net.meta.id
    ip_address = "10.200.0.11"
  }
  resources {
    cpu    = 2
    memory = 2048
  }
}

resource "vm" "fedora" {
  image {
    name = "europe-west1-docker.pkg.dev/instruqt/instruqt-sandbox/fedora-41:latest"
  }
  environment = {
    "ROLE" = "fedora"
  }
  startup_script = <<-EOT
  #!/bin/sh
  echo "$${ROLE}-ok" > /tmp/instruqt-startup-marker
EOT
  config {}
  network {
    id         = resource.network.lab_net.meta.id
    ip_address = "10.200.0.12"
  }
  resources {
    cpu    = 2
    memory = 2048
  }
}

resource "vm" "centos" {
  image {
    name = "europe-west1-docker.pkg.dev/instruqt/instruqt-sandbox/centos-8:latest"
  }
  environment = {
    "ROLE" = "centos"
  }
  startup_script = <<-EOT
  #!/bin/sh
  echo "$${ROLE}-ok" > /tmp/instruqt-startup-marker
EOT
  config {}
  network {
    id         = resource.network.lab_net.meta.id
    ip_address = "10.200.0.13"
  }
  resources {
    cpu    = 2
    memory = 2048
  }
}

resource "vm" "rockylinux" {
  image {
    name = "europe-west1-docker.pkg.dev/instruqt/instruqt-sandbox/rockylinux-9:latest"
  }
  environment = {
    "ROLE" = "rockylinux"
  }
  startup_script = <<-EOT
  #!/bin/sh
  echo "$${ROLE}-ok" > /tmp/instruqt-startup-marker
EOT
  config {}
  network {
    id         = resource.network.lab_net.meta.id
    ip_address = "10.200.0.14"
  }
  resources {
    cpu    = 2
    memory = 2048
  }
}

resource "vm" "dockervm" {
  image {
    name = "europe-west1-docker.pkg.dev/instruqt/instruqt-sandbox/docker-vm:latest"
  }
  environment = {
    "ROLE" = "dockervm"
  }
  startup_script = <<-EOT
  #!/bin/sh
  echo "$${ROLE}-ok" > /tmp/instruqt-startup-marker
EOT
  config {}
  network {
    id         = resource.network.lab_net.meta.id
    ip_address = "10.200.0.15"
  }
  resources {
    cpu    = 2
    memory = 2048
  }
}

resource "vm" "k3svm" {
  image {
    name = "europe-west1-docker.pkg.dev/instruqt/instruqt-sandbox/k3s-vm:latest"
  }
  environment = {
    "ROLE" = "k3svm"
  }
  startup_script = <<-EOT
  #!/bin/sh
  echo "$${ROLE}-ok" > /tmp/instruqt-startup-marker
EOT
  config {}
  network {
    id         = resource.network.lab_net.meta.id
    ip_address = "10.200.0.16"
  }
  resources {
    cpu    = 2
    memory = 2048
  }
}
