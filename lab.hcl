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
    tab "terminal" {
      target = resource.terminal.shell
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
      enabled = false
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
