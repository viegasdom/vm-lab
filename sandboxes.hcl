
resource "vm" "ubuntu" {
  image {
    name = "europe-west1-docker.pkg.dev/instruqt/instruqt-sandbox/ubuntu-2204:latest"
  }
  environment = {
    "ROLE" = "beta"
  }
  port {
    local = "8080"
    host  = "8080"
  }
  startup_script = <<-EOT
  #!/bin/sh
  echo "$${ROLE}-ok" > /tmp/instruqt-startup-marker
  mkdir -p /tmp/www
  echo "hello from vm" > /tmp/www/index.html
  cd /tmp/www && nohup python3 -m http.server 8080 > /dev/null 2>&1 &
EOT
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
    timeout = "600s"
    exec {
      script = "#!/bin/sh -e\ntest -f /tmp/instruqt-startup-marker\n"
    }
  }
}
