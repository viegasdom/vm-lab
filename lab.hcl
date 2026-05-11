resource "network" "lab_net" {
  subnet = "10.200.0.0/24"
}

resource "container" "shell" {
  image {
    name = "alpine:latest"
  }

  command = ["tail", "-f", "/dev/null"]

  network {
    id         = resource.network.lab_net.meta.id
    ip_address = "10.200.0.20"
  }
}

resource "terminal" "shell" {
  target = resource.container.shell
}

resource "layout" "main" {
  column {
    tab "container" {
      title  = "Container"
      target = resource.terminal.shell
    }
    tab "ubuntu" {
      title  = "Ubuntu"
      target = resource.terminal.ubuntu
    }
    tab "debian" {
      title  = "Debian"
      target = resource.terminal.debian
    }
    tab "fedora" {
      title  = "Fedora"
      target = resource.terminal.fedora
    }
    tab "centos" {
      title  = "CentOS"
      target = resource.terminal.centos
    }
    tab "rockylinux" {
      title  = "Rocky Linux"
      target = resource.terminal.rockylinux
    }
    tab "dockervm" {
      title  = "Docker VM"
      target = resource.terminal.dockervm
    }
    tab "k3svm" {
      title  = "K3s VM"
      target = resource.terminal.k3svm
    }
  }

  column {
    instructions {
    }
  }
}

resource "page" "getting_started" {
  title = "Getting Started"
  file  = "instructions/getting-started.md"
}

resource "lab" "vm_lab" {
  title       = "VM Lab"
  description = "Test lab with an Ubuntu 22.04 VM and Alpine container on the same network."

  settings {
    idle {
      enabled      = false
      show_warning = false
    }
    timelimit {
      duration = "1h"
    }
  }

  layout = resource.layout.main

  content {
    chapter "introduction" {
      title = "Introduction"

      page "getting_started" {
        reference = resource.page.getting_started
      }
    }
  }
}
