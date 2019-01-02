resource "google_project" "elasticsearch_on_k8s" {
  name = "elasticsearch-on-k8s-sample"
  project_id = "${var.project_id}"
  billing_account = "${var.billing_account}"
}