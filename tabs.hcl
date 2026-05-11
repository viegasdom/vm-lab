resource "terminal" "ubuntu" {
  target = resource.vm.ubuntu
}

resource "terminal" "debian" {
  target = resource.vm.debian
}

resource "terminal" "fedora" {
  target = resource.vm.fedora
}

resource "terminal" "centos" {
  target = resource.vm.centos
}

resource "terminal" "rockylinux" {
  target = resource.vm.rockylinux
}

resource "terminal" "dockervm" {
  target = resource.vm.dockervm
}

resource "terminal" "k3svm" {
  target = resource.vm.k3svm
}
