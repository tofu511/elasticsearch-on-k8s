variable "project_id" { default = "elasticsearch-on-k8s-sample" }
variable "billing_account" {}

variable "cluster_name" { default = "elasticsearch"}
variable "zone" { default = "asia-northeast1-a"}
variable "additional_zones" {
  default = [ "asia-northeast1-b", "asia-northeast1-c", ]
}
variable "initial_node_count" { default = 4 }
variable "machine_type" { default = "n1-standard-2" }
variable "disk_size_gb" { default = 10 }