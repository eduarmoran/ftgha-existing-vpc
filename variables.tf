//AWS Configuration
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "XXXXXXXX"
}

// Availability zone 1 for the region
variable "az1" {
  default = "XXXXXXXX"
}

// Availability zone 2 for the region
variable "az2" {
  default = "XXXXXXXX"
}

// IAM role that has proper permission for HA
// Refer to the URL For details. https://docs.fortinet.com/document/fortigate-public-cloud/7.2.0/aws-administration-guide/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "XXXXXXXX"    //Put in the IAM Role name created
}

variable "vpcid" {
  description = "VPC ID"
  default     = "XXXXXXXX"        //Put in the VPC ID created
}

variable "vpccidr" {
  default = "XXXXXXXX"        //Put in the VPC CIDR created
}

variable "publiccidraz1id" {
  description = "Public Subnet - AZ1 ID"
  default     = "XXXXXXXX"              //Put in the Subnet ID to "Public Subnet - AZ1 ID" created => You will find this information in the AWS VPC Console
}

variable "privatecidraz1id" {
  description = "Private Subnet - AZ1 ID"
  default     = "XXXXXXXX"        
}

variable "hasynccidraz1id" {
  description = "HASYNC Subnet - AZ1 ID"
  default     = "XXXXXXXX"         
}

variable "hamgmtcidraz1id" {
  description = "HAMGMT Subnet - AZ1 ID"
  default     = "XXXXXXXX"         
}

variable "publiccidraz2id" {
  description = "Public Subnet - AZ2 ID"
  default     = "XXXXXXXX"         //Put in the Subnet ID to "Public Subnet - AZ2 ID" created => You will find this information in the AWS VPC Console
}

variable "privatecidraz2id" {
  description = "Private Subnet - AZ2 ID"
  default     = "XXXXXXXX"
}

variable "hasyncidraz2id" {
  description = "HASYNC Subnet - AZ2 ID"
  default     = "XXXXXXXX"
}

variable "hamgmtidraz2id" {
  description = "HAMGMT Subnet - AZ2 ID"
  default     = "XXXXXXXX"
}

variable "hamgmtcidraz2" {
  default = "20.1.13.0/24"
}

// License Type to create FortiGate-VM
// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// instance architect
// Either arm or x86
variable "arch" {
  default = "arm"
}

// instance type needs to match the architect
// c5n.xlarge is x86_64
// c6g.xlarge is arm
// For detail, refer to https://aws.amazon.com/ec2/instance-types/
variable "size" {
  default = "c6g.xlarge"
}

// AMIs for FGTVM-7.2.4
variable "fgtami" {
  type = map(any)
  default = {
    us-east-1 = {
      arm = {
        payg = "ami-0d6d152f9919cee47"
        byol = "ami-0d702463a4d694f70"
      },
      x86 = {
        payg = "ami-0c060976cbbba34f6"
        byol = "ami-01f5501a825a18928"
      }
    },
    us-east-2 = {
      arm = {
        payg = "ami-0e9573e8922715847"
        byol = "ami-08767eb1b1c672f4b"
      },
      x86 = {
        payg = "ami-0b29abb59e00e9978"
        byol = "ami-0063d4810c57684cc"
      }
    },
    us-west-1 = {
      arm = {
	payg = "ami-01677fe5ad4ba546a"
        byol = "ami-00e902aaf2d17bc31"
      },
      x86 = {
        payg = "ami-04993d32cf0ac4a9e"
        byol = "ami-0032e1fec57c21ef4"
      }
    },
    us-west-2 = {
      arm = {
        payg = "ami-0558d0bc2bbccd1e6"
        byol = "ami-0c25c4372226c7499"
      },
      x86 = {
        payg = "ami-023d43c8c28258f24"
        byol = "ami-08381c32410917a16"
      }
    },
    af-south-1 = {
      arm = {
        payg = "ami-0cfd94c7f62aeb266"
        byol = "ami-03a8b40f1304de733"
      },
      x86 = {
        payg = "ami-08700b5084e959d34"
        byol = "ami-0b7574e426c74819e"
      }
    },
    ap-east-1 = {
      arm = {
        payg = "ami-07985b3758af6ce0b"
        byol = "ami-054fa7923c8b33973"
      },
      x86 = {
        payg = "ami-096fbf3686e4db55d"
        byol = "ami-0b318fe264bb658e6"
      }
    },
   ap-southeast-3 = {
      arm = {
        payg = "ami-006795fd8e04e8c47"
        byol = "ami-0cac793d49e6231eb"
      },
      x86 = {
        payg = "ami-0c03c04aed17ed1fc"
        byol = "ami-01c2eb659d7491eb2"
      }
    },
    ap-south-1 = {
      arm = {
        payg = "ami-0f4641f88284dc63d"
        byol = "ami-0d6649daed0178ec7"
      },
      x86 = {
        payg = "ami-0e8be06e5ec41ad10"
        byol = "ami-07943e7eec4666ffb"
      }
    },
    ap-northeast-3 = {
      arm = {
        payg = "ami-0ac3255a21dc9aa97"
        byol = "ami-0f2572cd3098a6eff"
      },
      x86 = {
        payg = "ami-0e6f8219fd25a2270"
        byol = "ami-0fe743714465d8ff4"
      }
    },
    ap-northeast-2 = {
      arm = {
        payg = "ami-0caf07a9e8ab64a0e"
        byol = "ami-0e679008b002b0fdc"
      },
      x86 = {
        payg = "ami-0842503a324f53632"
        byol = "ami-0e9bf0fd055971402"
      }
    },
    ap-southeast-1 = {
      arm = {
        payg = "ami-09f13a2df79f5cc46"
        byol = "ami-0e26f2b9e44812a28"
      },
      x86 = {
        payg = "ami-00ff48c72cac88cf1"
        byol = "ami-0475a5950c1eda2f2"
      }
    },
    ap-southeast-2 = {
      arm = {
        payg = "ami-0bb9b2f81e4ee7ce0"
        byol = "ami-0cadaa8f3dbf9035d"
      },
      x86 = {
        payg = "ami-0ee4153f640f145c5"
        byol = "ami-0d1768c7793dd800e"
      }
    },
    ap-northeast-1 = {
      arm = {
        payg = "ami-001cb75732e1951ed"
        byol = "ami-066485f1a45d5e28e"
      },
      x86 = {
        payg = "ami-0f413df152d16824c"
        byol = "ami-081ca316b059baebf"
      }
    },
    ca-central-1 = {
      arm = {
        payg = "ami-0ab5a898fc322623c"
        byol = "ami-072441a86b3402dfb"
      },
      x86 = {
        payg = "ami-0c459aafeb22e61f1"
        byol = "ami-0e3fa860693ea8ff1"
      }
    },
    eu-central-1 = {
      arm = {
        payg = "ami-0c6cafad59d838f7f"
        byol = "ami-0a3b1ed3209fe40dc"
      },
      x86 = {
        payg = "ami-06c6beeb526045545"
        byol = "ami-07e93bf00b36addff"
      }
    },
    eu-west-1 = {
      arm = {
        payg = "ami-01bf5033201e6e3b0"
        byol = "ami-0286ae794f64fb87d"
      },
      x86 = {
        payg = "ami-039aedaa91b1abfb2"
        byol = "ami-08d9996a44857f440"
      }
    },
    eu-west-2 = {
      arm = {
        payg = "ami-06b2aa535543180ec"
        byol = "ami-071e9a61e657e09bc"
      },
      x86 = {
        payg = "ami-0567b135b850a1f66"
        byol = "ami-0c656bb7d0d0999b3"
      }
    },
    eu-south-1 = {
      arm = {
        payg = "ami-083762fb4feeca77d"
        byol = "ami-0185b3fb3e031d10a"
      },
      x86 = {
        payg = "ami-0ddfa893e5391d59d"
        byol = "ami-0e2767de3cd2f9e29"
      }
    },
    eu-west-3 = {
      arm = {
        payg = "ami-026183da64c5f71f1"
        byol = "ami-0396d66c9bcb2774c"
      },
      x86 = {
        payg = "ami-07db225c929875da0"
        byol = "ami-04e99d8f826a6a583"
      }
    },
    eu-north-1 = {
      arm = {
        payg = "ami-04d328aab696cd51b"
        byol = "ami-08e3e751c40cea3fe"
      },
      x86 = {
        payg = "ami-0de9cc616ccb461dd"
        byol = "ami-0e09f41ea4b6ebd41"
      }
    },
    me-south-1 = {
      arm = {
        payg = "ami-05084dc5be758ba53"
        byol = "ami-0ff81c22e59c3110b"
      },
      x86 = {
        payg = "ami-0a67cd1cc81e9448b"
        byol = "ami-0ee364800dcbdb84a"
      }
    },
    sa-east-1 = {
      arm = {
        payg = "ami-0ad4a0d50cde97133"
        byol = "ami-004ef9ce7982c01ba"
      },
      x86 = {
        payg = "ami-0ad0eb946b258b7b7"
        byol = "ami-0aaec97c42fea1fbb"
      }
    }
  }
}

//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "std-keypair"
}

// HTTPS access port
variable "adminsport" {
  default = "8443"
}

variable "activeport1" {
  description = "Active FGT port1 ip address, needs to be same subnet as Public Subnet in AZ1"
  default     = "20.1.0.10"
}

variable "activeport1mask" {
  default = "255.255.255.0"
}

variable "activeport2" {
  description = "Active FGT port2 ip address, needs to be same subnet as Private Subnet in AZ1"
  default     = "20.1.1.10"
}

variable "activeport2mask" {
  default = "255.255.255.0"
}

variable "activeport3" {
  description = "Active FGT port3 ip address, needs to be same subnet as HASYNC Subnet in AZ1"
  default     = "20.1.2.10"
}

variable "activeport3mask" {
  default = "255.255.255.0"
}

variable "activeport4" {
  description = "Active FGT port4 ip address, needs to be same subnet as HAMGMT Subnet in AZ1"
  default     = "20.1.3.10"
}

variable "activeport4mask" {
  default = "255.255.255.0"
}

variable "passiveport1" {
  description = "Passive FGT port1 ip address, needs to be same subnet as Public Subnet in AZ2"
  default     = "20.1.10.10"
}

variable "passiveport1mask" {
  default = "255.255.255.0"
}

variable "passiveport2" {
  description = "Passive FGT port2 ip address, needs to be same subnet as Private Subnet in AZ2"
  default     = "20.1.11.10"
}

variable "passiveport2mask" {
  default = "255.255.255.0"
}

variable "passiveport3" {
  description = "Passive FGT port3 ip address, needs to be same subnet as HASYNC Subnet in AZ2"
  default     = "20.1.12.10"
}

variable "passiveport3mask" {
  default = "255.255.255.0"
}

variable "passiveport4" {
  description = "Passive FGT port4 ip address, needs to be same subnet as HAMGMT Subnet in AZ2"
  default     = "20.1.13.10"
}

variable "passiveport4mask" {
  default = "255.255.255.0"
}

variable "activeport1gateway" {
  default = "20.1.0.1"
}

variable "activeport2gateway" {
  default = "20.1.1.1"
}

variable "activeport4gateway" {
  default = "20.1.3.1"
}

variable "passiveport1gateway" {
  default = "20.1.10.1"
}

variable "passiveport2gateway" {
  default = "20.1.11.1"
}

variable "passiveport4gateway" {
  default = "20.1.13.1"
}


variable "bootstrap-active" {
  // Change to your own path
  type    = string
  default = "config-active.conf"
}

variable "bootstrap-passive" {
  // Change to your own path
  type    = string
  default = "config-passive.conf"
}

// license file for the active fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

// license file for the passive fgt
variable "license2" {
  // Change to your own byol license file, license2.lic
  type    = string
  default = "license2.lic"
}

