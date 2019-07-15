resource "aws_eks_cluster" "demo" {
  name = "${var.cluster-name}"
  role_arn = "${aws_iam_role.elasticsearch-cluster.arn}"

  vpc_config {
	  security_group_ids = ["${aws_security_group.elasticsearch-cluster.id}"]
	  subnet_ids = ["${aws_subnet.demo.*.id}"]
  }

  depends_on = [
	  "aws_iam_role_policy_attachment.elasticsearch-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.elasicsearch-cluster-AmazonEKSServicePolicy",
  ]

}
