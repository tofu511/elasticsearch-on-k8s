variable "project_id" { default = "elasticseatch-on-k8s" }
variable "billing_account" {}

variable "cluster_name" { default = "elasticsearch"}
variable "zone" { default = "asia-northeast1-a"}
variable "additional_zones" {
  default = [ "asia-northeast1-b", "asia-northeast1-c", ]
}
variable "initial_node_count" { default = 1 }
variable "machine_type" { default = "n1-standard-1" }
variable "disk_size_gb" { default = 10 }