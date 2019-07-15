data "aws_ami" "eks-worker" {
  filter {
	  name = "name"
	  values = ["amazon-eks-node-${aws_eks_cluster.demo.version}-v*"]
  }

  most_recent = true
  owners = ["602401143452"]
}

locals {
  demo-node-userdata = <<EOF
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.demo.endpoint}' --b64-cluster-ca '${aws_eks_cluster.demo.certificate_authority.0.data}' '${var.cluster-name}'
EOF
}

resource "aws_launch_configuration" "demo" {
  associate_public_ip_address = true
  iam_instance_profile = "${aws_iam_instance_profile.demo-node.name}"
  image_id = "${data.aws_ami.eks-worker.id}"
  instance_type = "m4.large"
  name_prefix = "es-on-eks"
  security_groups = ["${aws_security_group.demo-node.id}"]
  user_data_base64 = "${base64encode(local.demo-node-userdata)}"

  lifecycle {
	  create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "demo" {
  desired_capacity = 2
  launch_configuration = "${aws_launch_configuration.demo.id}"
  max_size = 2
  min_size = 1
  name = "es-on-eks-demo"
  vpc_zone_identifier = ["${aws_subnet.demo.*.id}"]

  tag {
	  key = "Name"
	  value = "es-on-eks-demo"
	  propagate_at_launch = true
  }

  tag {
	  key = "kubernetes.io/cluster/${var.cluster-name}"
	  value = "owned"
	  propagate_at_launch = true
  }
}
