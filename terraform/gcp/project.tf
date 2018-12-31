resource "google_project" "elasticsearch_on_k8s" {
  name = "Elasticsearch on k8s"
  project_id = "${var.project_id}"
  billing_account = "${var.billing_account}"
}