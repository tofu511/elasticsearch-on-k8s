resource "google_container_cluster" "gke" {
  name = "${var.cluster_name}"
  zone = "${var.zone}"
//  network = ""
  initial_node_count = "${var.initial_node_count}"

  node_config {
    machine_type = "${var.machine_type}"
    disk_size_gb = "${var.disk_size_gb}"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/cloud-platform.read-only",
      "https://www.googleapis.com/auth/service.management",
      "https://www.googleapis.com/auth/service.management.readonly",
    ]
  }
}

