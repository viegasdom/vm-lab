resource "terminal" "test123" {
  target = resource.vm.ubuntu
}

resource "service" "web" {
  target = resource.vm.ubuntu
  port   = 8080
  path   = "/"
}
