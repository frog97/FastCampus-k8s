resource "aws_autoscaling_group" "tfer--eks-hh-fc-k8s4dev-eks-nodegroup-e0c49e93-ffc5-55bf-4f8e-7e85c36997ca" {
  availability_zones        = ["ap-northeast-2a", "ap-northeast-2c"]
  capacity_rebalance        = "true"
  default_cooldown          = "300"
  default_instance_warmup   = "0"
  desired_capacity          = "2"
  force_delete              = "false"
  health_check_grace_period = "15"
  health_check_type         = "EC2"
  max_instance_lifetime     = "0"
  max_size                  = "3"
  metrics_granularity       = "1Minute"
  min_size                  = "1"

  mixed_instances_policy {
    instances_distribution {
      on_demand_allocation_strategy            = "prioritized"
      on_demand_base_capacity                  = "0"
      on_demand_percentage_above_base_capacity = "100"
      spot_allocation_strategy                 = "lowest-price"
      spot_instance_pools                      = "2"
    }

    launch_template {
      launch_template_specification {
        launch_template_id   = "lt-0d0d3edd1b5e1f9d0"
        launch_template_name = "eks-e0c49e93-ffc5-55bf-4f8e-7e85c36997ca"
        version              = "1"
      }

      override {
        instance_type = "t3.medium"
      }
    }
  }

  name                    = "eks-hh-fc-k8s4dev-eks-nodegroup-e0c49e93-ffc5-55bf-4f8e-7e85c36997ca"
  protect_from_scale_in   = "false"
  service_linked_role_arn = "arn:aws:iam::046822486271:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"

  tag {
    key                 = "eks:cluster-name"
    propagate_at_launch = "true"
    value               = "hh-fc-k8s4dev-eks-cluster"
  }

  tag {
    key                 = "eks:nodegroup-name"
    propagate_at_launch = "true"
    value               = "hh-fc-k8s4dev-eks-nodegroup"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    propagate_at_launch = "true"
    value               = "true"
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/hh-fc-k8s4dev-eks-cluster"
    propagate_at_launch = "true"
    value               = "owned"
  }

  tag {
    key                 = "kubernetes.io/cluster/hh-fc-k8s4dev-eks-cluster"
    propagate_at_launch = "true"
    value               = "owned"
  }

  termination_policies      = ["AllocationStrategy", "OldestInstance", "OldestLaunchTemplate"]
  vpc_zone_identifier       = ["subnet-06891e5a7b4742071", "subnet-09869431922bdc2d3"]
  wait_for_capacity_timeout = "10m"
}
