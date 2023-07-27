resource "aws_launch_template" "tfer--Karpenter-ail-dev-18017424422536352272" {
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      encrypted   = "true"
      iops        = "0"
      throughput  = "0"
      volume_size = "20"
      volume_type = "gp3"
    }
  }

  default_version         = "1"
  disable_api_stop        = "false"
  disable_api_termination = "false"

  iam_instance_profile {
    name = "KarpenterNodeInstanceProfile-ail-dev"
  }

  image_id = "ami-0ed39f52c0b66ac73"

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
  }

  name = "Karpenter-ail-dev-18017424422536352272"

  tag_specifications {
    resource_type = "network-interface"

    tags = {
      Name                            = "karpenter.sh/provisioner-name/default"
      "karpenter.sh/provisioner-name" = "default"
    }
  }

  tags = {
    Name                            = "karpenter.sh/provisioner-name/default"
    "karpenter.k8s.aws/cluster"     = "ail-dev"
    "karpenter.sh/provisioner-name" = "default"
  }

  tags_all = {
    Name                            = "karpenter.sh/provisioner-name/default"
    "karpenter.k8s.aws/cluster"     = "ail-dev"
    "karpenter.sh/provisioner-name" = "default"
  }

  user_data              = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiB0ZXh0L3gtc2hlbGxzY3JpcHQ7IGNoYXJzZXQ9InVzLWFzY2lpIgoKIyEvYmluL2Jhc2ggLXhlCmV4ZWMgPiA+KHRlZSAvdmFyL2xvZy91c2VyLWRhdGEubG9nfGxvZ2dlciAtdCB1c2VyLWRhdGEgLXMgMj4vZGV2L2NvbnNvbGUpIDI+JjEKL2V0Yy9la3MvYm9vdHN0cmFwLnNoICdhaWwtZGV2JyAtLWFwaXNlcnZlci1lbmRwb2ludCAnaHR0cHM6Ly8yOEM5NjM4MjQ2OEU3MzlDQzJBM0E4RjU5NjI5QTM0Ny5ncjcuYXAtbm9ydGhlYXN0LTIuZWtzLmFtYXpvbmF3cy5jb20nIC0tYjY0LWNsdXN0ZXItY2EgJ0xTMHRMUzFDUlVkSlRpQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENrMUpTVU12YWtORFFXVmhaMEYzU1VKQlowbENRVVJCVGtKbmEzRm9hMmxIT1hjd1FrRlJjMFpCUkVGV1RWSk5kMFZSV1VSV1VWRkVSWGR3Y21SWFNtd0tZMjAxYkdSSFZucE5RalJZUkZSSmVrMUVSWGROZWtWM1RWUlJlRTlXYjFoRVZFMTVUVlJKZWsxVVJYZE5WRkY0VDFadmQwWlVSVlJOUWtWSFFURlZSUXBCZUUxTFlUTldhVnBZU25WYVdGSnNZM3BEUTBGVFNYZEVVVmxLUzI5YVNXaDJZMDVCVVVWQ1FsRkJSR2RuUlZCQlJFTkRRVkZ2UTJkblJVSkJUV1I2Q25SemVYZDNOVFF3TkU5Rk16WnlUa2QzUzNaaVlrRjVhVFZaV2xoa0wxRkVOVTFoWW1sb1JtWmtOWGRDTjNGamVISlVZVTFoUzNKblRXUnBUWHB3Ym1rS1lUWXpWemN4TTI5aE1qSlpNaklyUW5oMVJVNXhTRzUzVERGMFJXdzRjWHBtYVcwclZ6Y3hiWFZpTVhjeEsyOXBSRzFtVEdsRVprRTVSVkpKT0dKelpBcFFVWHB3WmtWTGVXUmtNelJLYzFKb1RHbFNTVlJ0UW5Ga2NrdHBTVWs0UWpNdk1qTmhVVEpwWm5wVmNEUXlOelJDTDJzd1YybEZhVkJvWXpaTGRGWndDblpMTmpScFprTXZMMWRpYzBSWksyeFBLeXRRVUhZeEwyMVVTbkJEUlRBclUyOXhTemh4U1c5VU4wVmphR1YyVmtsc1MwRjVhRE5LYVRNeWNsWmhaSGNLYWxreFVHOHpiSHBHYzB4NVZVdDBWWEZJYUUxME1DOUxMMVJLVHk5M01rWnRNV3RrTWtocUszUnVWVXRRTUZWVWFuSlBlRmsyWkZwelRFUm5NMjFoWlFwNGJGUjFZVFJWWTJ0eFlXOW9jRWRDVDNKRlEwRjNSVUZCWVU1YVRVWmpkMFJuV1VSV1VqQlFRVkZJTDBKQlVVUkJaMHRyVFVFNFIwRXhWV1JGZDBWQ0NpOTNVVVpOUVUxQ1FXWTRkMGhSV1VSV1VqQlBRa0paUlVaSGFqSk1OWHB2UldaWFUwSkNaR1JWVW1oblNreHVZM2d6YlRWTlFsVkhRVEZWWkVWUlVVOEtUVUY1UTBOdGRERlpiVlo1WW0xV01GcFlUWGRFVVZsS1MyOWFTV2gyWTA1QlVVVk1RbEZCUkdkblJVSkJRUzh6YlZZcmRtaHNZWFpyVVVwSlNYUTBaQXBhTkdabFJFUm5PWGRLU1RCNGJqQjFZV29yVTJseVJubGxTR3ROUldkSWRHVlFjbGMxZGtkWlEwRTBlalUzZFZkMlYweHZkR1IxYVhJck1XWTJkbkpwQ2paTVJEUlRMemNyV1ZadmRUWm1aMDF6VG1WVWIwTXpabmhUVVhReFJrOW5TR2xvV0RkUWMxQkJObEJMTlVGcVF6SllXbEpoTmxvMVMwaG1aM1pOU2pJS09WQXZiWEJ6WjBjM05UbGpVMDlhTUZJNFlYTlNjbGh5VjJ0RVozZExTeko1WVRKR2NWVm5kalJCT0hZM2NFOVBVSGd3VWxrNVlYUllWM1YyVFROTlRncE9NRmhMYUdRcmNWSnRNeXRGTkhod1JtOURXSGhOZVhZdlZtdzVWRTQwWkRWeVVubERTSFZQVEZwM1ZXdHdWM0pSYW1GNE5ESnhibGh3VDNRM09EQkVDbUkwV1RjM2RFOTZXRnBCWTFaa2NsRXhLMjFrTmxwNldsbDRhRXRVVUdwMFRXWkZabEpwWTFka2NESkdSRGN2YldsNk1rWTNjVXN3TTNsU1NHY3hWbmdLUlZWclBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0nIFwKLS1jb250YWluZXItcnVudGltZSBjb250YWluZXJkIFwKLS1rdWJlbGV0LWV4dHJhLWFyZ3MgJy0tbm9kZS1sYWJlbHM9a2FycGVudGVyLnNoL2NhcGFjaXR5LXR5cGU9c3BvdCxrYXJwZW50ZXIuc2gvcHJvdmlzaW9uZXItbmFtZT1kZWZhdWx0JwotLS8vLS0K"
  vpc_security_group_ids = ["sg-08b8b8bd3e55d2ce6", "sg-0fb89520cba1e65da"]
}

resource "aws_launch_template" "tfer--Karpenter-ail-dev-448331096189852245" {
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      encrypted   = "true"
      iops        = "0"
      throughput  = "0"
      volume_size = "20"
      volume_type = "gp3"
    }
  }

  default_version         = "1"
  disable_api_stop        = "false"
  disable_api_termination = "false"

  iam_instance_profile {
    name = "KarpenterNodeInstanceProfile-ail-dev"
  }

  image_id = "ami-0ed39f52c0b66ac73"

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "2"
    http_tokens                 = "required"
  }

  name = "Karpenter-ail-dev-448331096189852245"

  tag_specifications {
    resource_type = "network-interface"

    tags = {
      Name                            = "karpenter.sh/provisioner-name/default"
      "karpenter.sh/provisioner-name" = "default"
    }
  }

  tags = {
    Name                            = "karpenter.sh/provisioner-name/default"
    "karpenter.k8s.aws/cluster"     = "ail-dev"
    "karpenter.sh/provisioner-name" = "default"
  }

  tags_all = {
    Name                            = "karpenter.sh/provisioner-name/default"
    "karpenter.k8s.aws/cluster"     = "ail-dev"
    "karpenter.sh/provisioner-name" = "default"
  }

  user_data              = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiB0ZXh0L3gtc2hlbGxzY3JpcHQ7IGNoYXJzZXQ9InVzLWFzY2lpIgoKIyEvYmluL2Jhc2ggLXhlCmV4ZWMgPiA+KHRlZSAvdmFyL2xvZy91c2VyLWRhdGEubG9nfGxvZ2dlciAtdCB1c2VyLWRhdGEgLXMgMj4vZGV2L2NvbnNvbGUpIDI+JjEKL2V0Yy9la3MvYm9vdHN0cmFwLnNoICdhaWwtZGV2JyAtLWFwaXNlcnZlci1lbmRwb2ludCAnaHR0cHM6Ly8yMzNCOTEwN0UyMTNDMzg1MzFCQjZFQzlCMUQ3M0NGRi5ncjcuYXAtbm9ydGhlYXN0LTIuZWtzLmFtYXpvbmF3cy5jb20nIC0tYjY0LWNsdXN0ZXItY2EgJ0xTMHRMUzFDUlVkSlRpQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENrMUpTVU12YWtORFFXVmhaMEYzU1VKQlowbENRVVJCVGtKbmEzRm9hMmxIT1hjd1FrRlJjMFpCUkVGV1RWSk5kMFZSV1VSV1VWRkVSWGR3Y21SWFNtd0tZMjAxYkdSSFZucE5RalJZUkZSSmVrMUVSWGROZWtGNFRrUlpNRTVzYjFoRVZFMTVUVlJKZWsxVVFYaE9SRmt3VG14dmQwWlVSVlJOUWtWSFFURlZSUXBCZUUxTFlUTldhVnBZU25WYVdGSnNZM3BEUTBGVFNYZEVVVmxLUzI5YVNXaDJZMDVCVVVWQ1FsRkJSR2RuUlZCQlJFTkRRVkZ2UTJkblJVSkJUVEYxQ2xScE9XRTVhRzVTYWpKMFZXVldUMk5WWkRJeE9HVkJhM2htTld4S1dHdGpPRFZyU0UxWmFGbDVhVkEwYUVRM1FpOWpMMWxLY21SV1pWUm9ZVXhzZHpRS2FHSnNWVmRSWmpaNU1IRllMMFZsUVRKelpsTkNRMlJMSzJ4bldrRXZiell2VERoTWFFWTVWM0JDVEhsRlVYRXhMM2N2ZEZKRWRUaDJjM2hvVVZKUFpBcDNVRXBOUVhWTE9FSk9XRmw1T1hkb05rMTNlRUZ2VW00NWQzRkdiMGt6UkhSWU1ubFhTRlV4UmtKQ1Z6WTNlVGgzWnpOd2NuSjBjVXN4U0VSbFVXOWxDak5oZVhCdWJqVkxkMlZuUkdadlNqTm9NMFpOTWt4SmExTjFNVUZJV1VRd2JtRmFiM0JoUTIxMlpIRlBRbVZ6UjNWd01IQndaSEpYU1ZSTU1EaENTbUlLVEZOcVpFZFlNMFptUkVSVWRXUnZlVko0TjJwYWRETmFNRkp4TVRSdGMwSk1jMlpsTUVWTGQzUmpkbmRRZUV0M1VFNW9NWFpyWkdZd2NFcHBSa05UWkFwU1RqTnBVakJKVUhsaFduVlZTbTlZTDFaelEwRjNSVUZCWVU1YVRVWmpkMFJuV1VSV1VqQlFRVkZJTDBKQlVVUkJaMHRyVFVFNFIwRXhWV1JGZDBWQ0NpOTNVVVpOUVUxQ1FXWTRkMGhSV1VSV1VqQlBRa0paUlVaSFNGVktVV2RzT0dGSmJGaFRVMXBQVFVZeU1rRXllVzl6VTNsTlFsVkhRVEZWWkVWUlVVOEtUVUY1UTBOdGRERlpiVlo1WW0xV01GcFlUWGRFVVZsS1MyOWFTV2gyWTA1QlVVVk1RbEZCUkdkblJVSkJSM0JwVERWblpsUkNUbE5JY0dwSVpsTkxSZ3BJT1ZBclRrRTVTa3RJYVVGMGVWVkZTa1ZpY0hsNVdVRnpTVk5wZEc0dlIwcEVSVXN3ZDJjek9HaGFTR3BLVUdkcVdIRkdkR1IwV2k5V2JHZFVXa3RGQ2pWVVVGZHlSR0ZPVHk4cmNFTjJNRFp3ZUVwc2FYY3JSM2xGZFVwWGMzQjNVVlJHWjNodldETktUMVE0VFd0Nk5XZDRRbFZsT1VodmRHZGtVMUZOVnpjS0szTlhNeTkxUmxacVVrMXBLM0JDY0U5SFVtWTRTV0pRSzBSWE1DdDJZams1VDBWWmNHSlVlVTV2WjFkSlRrVnNjVVUyVVZWdWVsWnFabkJGTWpCRGR3cFdZa2RDZDBOck5HYzVRMDFpUm10TGFGcFVRazEzV25CTmNYVk5XR1pxZVVGR1RVTm1VRU01V2paaVYzRjBTRmRTYVRGT2JVcFhhVzl5VWtGeVUycFVDbE14VFdaR1VrVmFZM0p0TW1GTGVqUjVlRkpEY0U5WVMxVkROREZ4U0doVFpIVmFRMkY2V0V4bWMwTmxWa1ZGUlhKaGVrbGlTM2xoYVU0d1dESlhUMUlLYml0QlBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0nIFwKLS1jb250YWluZXItcnVudGltZSBjb250YWluZXJkIFwKLS1rdWJlbGV0LWV4dHJhLWFyZ3MgJy0tbm9kZS1sYWJlbHM9a2FycGVudGVyLnNoL2NhcGFjaXR5LXR5cGU9c3BvdCxrYXJwZW50ZXIuc2gvcHJvdmlzaW9uZXItbmFtZT1kZWZhdWx0JwotLS8vLS0K"
  vpc_security_group_ids = ["sg-02d143a2067b57a76", "sg-054271b61ff3192c4"]
}

resource "aws_launch_template" "tfer--eks-e0c49e93-ffc5-55bf-4f8e-7e85c36997ca" {
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = "true"
      iops                  = "0"
      throughput            = "0"
      volume_size           = "20"
      volume_type           = "gp2"
    }
  }

  default_version         = "1"
  disable_api_stop        = "false"
  disable_api_termination = "false"

  iam_instance_profile {
    name = "eks-e0c49e93-ffc5-55bf-4f8e-7e85c36997ca"
  }

  image_id      = "ami-0f4516ee1fe91acc1"
  instance_type = "t3.medium"

  metadata_options {
    http_put_response_hop_limit = "2"
  }

  name = "eks-e0c49e93-ffc5-55bf-4f8e-7e85c36997ca"

  network_interfaces {
    device_index       = "0"
    ipv4_address_count = "0"
    ipv4_prefix_count  = "0"
    ipv6_address_count = "0"
    ipv6_prefix_count  = "0"
    network_card_index = "0"
    security_groups    = ["sg-059442ff9adc76578"]
  }

  tags = {
    "eks:cluster-name"   = "hh-fc-k8s4dev-eks-cluster"
    "eks:nodegroup-name" = "hh-fc-k8s4dev-eks-nodegroup"
  }

  tags_all = {
    "eks:cluster-name"   = "hh-fc-k8s4dev-eks-cluster"
    "eks:nodegroup-name" = "hh-fc-k8s4dev-eks-nodegroup"
  }

  user_data = "TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiBtdWx0aXBhcnQvbWl4ZWQ7IGJvdW5kYXJ5PSIvLyIKCi0tLy8KQ29udGVudC1UeXBlOiB0ZXh0L3gtc2hlbGxzY3JpcHQ7IGNoYXJzZXQ9InVzLWFzY2lpIgojIS9iaW4vYmFzaApzZXQgLWV4CkI2NF9DTFVTVEVSX0NBPUxTMHRMUzFDUlVkSlRpQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENrMUpTVU12YWtORFFXVmhaMEYzU1VKQlowbENRVVJCVGtKbmEzRm9hMmxIT1hjd1FrRlJjMFpCUkVGV1RWSk5kMFZSV1VSV1VWRkVSWGR3Y21SWFNtd0tZMjAxYkdSSFZucE5RalJZUkZSSmVrMUVZM2hOUkVGM1RWUk5lVTVzYjFoRVZFMTZUVVJqZDA1NlFYZE5WRTE1VG14dmQwWlVSVlJOUWtWSFFURlZSUXBCZUUxTFlUTldhVnBZU25WYVdGSnNZM3BEUTBGVFNYZEVVVmxLUzI5YVNXaDJZMDVCVVVWQ1FsRkJSR2RuUlZCQlJFTkRRVkZ2UTJkblJVSkJURmQ2Q2tWaFZrOTFPR1pWVm5aNEswZDFTbWh2TW1kcVlqWk1RMjExYUVSc2JGSmlaWFZYYWt0bFJHNXNZblpUVVRRcmFqTTVjMFEyV0dFM2JpdHZUa05LTVdvS1QycHJjV1owZDFKdFFXOUxkMEZQV2toSlVIUlllSFpoVDFnNWEyOVVOSFl6UnpNM2FqVndiVmxaZDFBNWJsRnBUVnBrVFd0MVFXZHVWbmxwYUc5V2RBcFVSVmRNUjNoTVJqQXhWelJTVjNoM1J6aGFRV3hLVm5oU09HVkdWMjFXYkRnek1Hb3dTMUJsZUc5elUyTk1aMDFKYlZWRlMzZzRhVGRoZEZadFREUkRDak5ZVGtoTk9HWnBhMGxDUml0eGNIRTFOVTVzYlUxRU1VNURXalJwYjNrMVNrWkdkRVpQY1VFdldtMXBhMmR3WjNOM1FYVm9WRlJ0T0c1NWRESndVVVVLYWxwNFkyeEpja3N3YkZOWVJHOXJabE42TkhkQlVYaFpVbmMyTmpabFdEWm5hamxTVXpneFJraDJVSFZsTm1KV1ZXVTJMMmhoVVhZMmFGcHdXbEl6Undvd2JsSnZURlJGT0ZGWWMwa3dlVGRsUTBnd1EwRjNSVUZCWVU1YVRVWmpkMFJuV1VSV1VqQlFRVkZJTDBKQlVVUkJaMHRyVFVFNFIwRXhWV1JGZDBWQ0NpOTNVVVpOUVUxQ1FXWTRkMGhSV1VSV1VqQlBRa0paUlVaUFdIRk9UVXhHTTNkb1VrRXhiRFJaZFVaWE5EQjJOSGhNY1hkTlFsVkhRVEZWWkVWUlVVOEtUVUY1UTBOdGRERlpiVlo1WW0xV01GcFlUWGRFVVZsS1MyOWFTV2gyWTA1QlVVVk1RbEZCUkdkblJVSkJRazF3YjFvelJGbHZZakozYjJSUVNtc3lkQXBXYjJSTWVTdE5UazFWUWxWVWRGSXlkV3REYlhOT1EycDRaV1ZsVnpSa2VtdEljemh4SzJ4dVJHWk9UVE40V21oTFpURm9kREl6YzNOUFVHbE1UREZyQ21oRE1DOHpNVlI0VXl0SmNWbE1WMHBuUWt0U1psUlpjRk41VjNFNVQzVjBkbU5rTW01SVJGVkhPVm8yWjBGd1owRjNObmRGTUdGakszSXdVVTFpVDBNS01YSnlZbm92Umxkck5ISllUVWRxTkVKdU56VTJNa0kyV1Zkd1RIUTRiVlpuY2tKUlR6RkRNbmhwZHpSWFdHOUlXbUZFVm1kSVkzRk5hVEJRUnpSU1NncENTbkZZYlRaM1YwTkdkeXRvZUVNMU9YVmxWWGs0UVhWVFNYZGxORkZRY0M5NlFtSlJNRXBETVc5SWIzVjRWVEpLU25sQ04yWmlaSGdyVVdoNFRUTnRDakkxVTBKV2NYTjZka2N6UW5ObU9FaFpaV2xhV2paaloxVkNSVFV6YUVGRVdtNUtNbUZ4WTNsTlRVZHNUVVoyWTNKT1YyaHFSVGd4ZVRSM1pXdEVhV2dLY204NFBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0KQVBJX1NFUlZFUl9VUkw9aHR0cHM6Ly9BNjNBNzVCOUI4QzFBQThGOUNEOEMxODZFOTY5MkM2Mi55bDQuYXAtbm9ydGhlYXN0LTIuZWtzLmFtYXpvbmF3cy5jb20KSzhTX0NMVVNURVJfRE5TX0lQPTE3Mi4yMC4wLjEwCi9ldGMvZWtzL2Jvb3RzdHJhcC5zaCBoaC1mYy1rOHM0ZGV2LWVrcy1jbHVzdGVyIC0ta3ViZWxldC1leHRyYS1hcmdzICctLW5vZGUtbGFiZWxzPWVrcy5hbWF6b25hd3MuY29tL25vZGVncm91cC1pbWFnZT1hbWktMGY0NTE2ZWUxZmU5MWFjYzEsZWtzLmFtYXpvbmF3cy5jb20vY2FwYWNpdHlUeXBlPU9OX0RFTUFORCxla3MuYW1hem9uYXdzLmNvbS9ub2RlZ3JvdXA9aGgtZmMtazhzNGRldi1la3Mtbm9kZWdyb3VwLHJvbGU9ZWtzLW5vZGVncm91cCAtLW1heC1wb2RzPTE3JyAtLWI2NC1jbHVzdGVyLWNhICRCNjRfQ0xVU1RFUl9DQSAtLWFwaXNlcnZlci1lbmRwb2ludCAkQVBJX1NFUlZFUl9VUkwgLS1kbnMtY2x1c3Rlci1pcCAkSzhTX0NMVVNURVJfRE5TX0lQIC0tdXNlLW1heC1wb2RzIGZhbHNlCgotLS8vLS0="
}

resource "aws_launch_template" "tfer--eksctl-2021-hjk-eksworkshop-eksctl-nodegroup-nodegroup" {
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      iops        = "3000"
      throughput  = "125"
      volume_size = "80"
      volume_type = "gp3"
    }
  }

  default_version         = "1"
  disable_api_stop        = "false"
  disable_api_termination = "false"

  metadata_options {
    http_put_response_hop_limit = "2"
    http_tokens                 = "optional"
  }

  name = "eksctl-2021-hjk-eksworkshop-eksctl-nodegroup-nodegroup"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name                             = "2021-hjk-eksworkshop-eksctl-nodegroup-Node"
      "alpha.eksctl.io/nodegroup-name" = "nodegroup"
      "alpha.eksctl.io/nodegroup-type" = "managed"
    }
  }

  tag_specifications {
    resource_type = "network-interface"

    tags = {
      Name                             = "2021-hjk-eksworkshop-eksctl-nodegroup-Node"
      "alpha.eksctl.io/nodegroup-name" = "nodegroup"
      "alpha.eksctl.io/nodegroup-type" = "managed"
    }
  }

  tag_specifications {
    resource_type = "volume"

    tags = {
      Name                             = "2021-hjk-eksworkshop-eksctl-nodegroup-Node"
      "alpha.eksctl.io/nodegroup-name" = "nodegroup"
      "alpha.eksctl.io/nodegroup-type" = "managed"
    }
  }

  vpc_security_group_ids = ["sg-0e4060852978d0843"]
}

resource "aws_launch_template" "tfer--hh-infra-manual-st" {
  default_version         = "2"
  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "false"
  image_id                = "ami-003ef1c0e2776ea27"
  instance_type           = "t3.micro"
  key_name                = "hhtest"
  name                    = "hh-infra-manual-st"

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
  }

  user_data              = "IyEvYmluL2Jhc2gKeXVtIHVwZGF0ZSAteQphbWF6b24tbGludXgtZXh0cmFzIGluc3RhbGwgLXkgbGFtcC1tYXJpYWRiMTAuMi1waHA3LjIgcGhwNy4yCnl1bSBpbnN0YWxsIC15IGh0dHBkIG1hcmlhZGItc2VydmVyCnN5c3RlbWN0bCBzdGFydCBodHRwZApzeXN0ZW1jdGwgZW5hYmxlIGh0dHBkCnVzZXJtb2QgLWEgLUcgYXBhY2hlIGVjMi11c2VyCmNob3duIC1SIGVjMi11c2VyOmFwYWNoZSAvdmFyL3d3dwpjaG1vZCAyNzc1IC92YXIvd3d3CmZpbmQgL3Zhci93d3cgLXR5cGUgZCAtZXhlYyBjaG1vZCAyNzc1IHt9IFw7CmZpbmQgL3Zhci93d3cgLXR5cGUgZiAtZXhlYyBjaG1vZCAwNjY0IHt9IFw7CmVjaG8gIjw/cGhwIHBocGluZm8oKTsgPz4iID4gL3Zhci93d3cvaHRtbC9waHBpbmZvLnBocA=="
  vpc_security_group_ids = ["sg-06dd364cf91053428"]
}

resource "aws_launch_template" "tfer--lt-Cloud-VAS-NLP-Dev" {
  block_device_mappings {
    device_name = "/dev/sdb"

    ebs {
      iops        = "0"
      snapshot_id = "snap-0a7e7008c4e00996e"
      throughput  = "0"
      volume_size = "25"
    }
  }

  block_device_mappings {
    device_name = "/dev/sdc"

    ebs {
      delete_on_termination = "true"
      encrypted             = "false"
      iops                  = "0"
      snapshot_id           = "snap-0cdb3bac1d9775aae"
      throughput            = "0"
      volume_size           = "100"
      volume_type           = "gp2"
    }
  }

  block_device_mappings {
    device_name = "/dev/sdd"

    ebs {
      iops        = "0"
      snapshot_id = "snap-00b6384e684c5ea53"
      throughput  = "0"
      volume_size = "50"
    }
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = "true"
      encrypted             = "false"
      iops                  = "0"
      snapshot_id           = "snap-0dd594c5827973ef8"
      throughput            = "0"
      volume_size           = "50"
      volume_type           = "gp2"
    }
  }

  default_version         = "1"
  disable_api_stop        = "false"
  disable_api_termination = "false"

  iam_instance_profile {
    arn = "arn:aws:iam::046822486271:instance-profile/role-dev-nlp"
  }

  image_id      = "ami-006e2f9fa7597680a"
  instance_type = "m5.xlarge"
  name          = "lt-Cloud-VAS-NLP-Dev"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "i-dev-thinqai-nlp"
    }
  }

  user_data              = "IyEvYmluL2Jhc2gKeXVtIHVwZGF0ZSAteQp5dW0gaW5zdGFsbCAteSBqYXZhLTEuOC4wLW9wZW5qZGstZGV2ZWwueDg2XzY0Cgpta2RpciAtcCAvZW5nbjAwMQpta2RpciAtcCAvZGF0YTAwMSAKbWtkaXIgLXAgL2xvZ3MwMDEKCm1rZnMuZXh0NCAvZGV2L3h2ZGMKbWtmcy5leHQ0IC9kZXYveHZkZAoKZWNobyAiL2Rldi94dmRiICAgIC9lbmduMDAxICAgIGV4dDQgICAgZGVmYXVsdHMsbm9mYWlsICAgICAgICAwICAgICAgIDIiID4+IC9ldGMvZnN0YWIKZWNobyAiL2Rldi94dmRjICAgIC9kYXRhMDAxICAgIGV4dDQgICAgZGVmYXVsdHMsbm9mYWlsICAgICAgICAwICAgICAgIDIiID4+IC9ldGMvZnN0YWIKZWNobyAiL2Rldi94dmRkICAgIC9sb2dzMDAxICAgIGV4dDQgICAgZGVmYXVsdHMsbm9mYWlsICAgICAgICAwICAgICAgIDIiID4+IC9ldGMvZnN0YWIKCm1vdW50IC1hCgpta2RpciAtcCAvbG9nczAwMS9qYnNhZG0vamJvc3M2MS9ubHBEb21haW4vY29yZW5scF84MDgwLwpta2RpciAtcCAvbG9nczAwMS9qYnNhZG0vamJvc3M2MS9ubHBEb21haW4vYml6bmxwXzgxODAvCgpta2RpciAtcCAvZGF0YTAwMS9ubHBhZG0vY29yZW5scC9hcHBsaWNhdGlvbnMKbWtkaXIgLXAgL2RhdGEwMDEvbmxwYWRtL3JlZl9iaXpubHAvYXBwbGljYXRpb25zCgpjaG93biAtUiAxMDAwOjEwMDAgL2VuZ24wMDEKY2hvd24gLVIgMTAwMDoxMDAwIC9kYXRhMDAxCmNob3duIC1SIDEwMDA6MTAwMCAvbG9nczAwMQoK"
  vpc_security_group_ids = ["sg-0a52e027fb663b06e"]
}
