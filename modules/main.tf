terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 4.2.0"
    }
  }
}

provider "docker" {
    host = "unix:///Users/ivanna.dudka/.colima/default/docker.sock"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
