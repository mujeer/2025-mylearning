# string type variable 

variable "file" {
  type    = string
  default = "file-1"

}

resource "local_file" "example_file" {
  content  = "Hello, Terraform!"
  filename = "/tmp/${var.file}"

}
#number 
variable "number" {
    type = number
    default = 2
}

resource "local_file" "example-number" {
  content  = "Hello, Terraform!"
  filename = "/tmp/${var.number}"

}
# number validation 
variable "number-validation" {
    type = number
    default = 5
    validation {
        condition = var.number-validation > 0
        error_message = "Please enter the number grater then 0"
      
    }
}

resource "local_file" "example-number-validation-1" {
  content  = "Hello, Terraform!"
  filename = "/tmp/${var.number-validation}"

}

variable "multi-type" {
    type = object({
      name1 = string
      name2 = number
    })
    default = {
      name1 = "mujeer"
      name2 = "5"
    }
}

resource "local_file" "example-number-validation-2" {
  content  = "Hello, Terraform!"
  filename = "/tmp/${var.multi-type.name1}"
}

variable "instance_types" {
  description = "List of EC2 instance types"
  type        = list(string)
  default     = ["t2.micro", "t2.small", "t2.medium"]
}

output "first_instance_type" {
  value = var.instance_types # Accessing the first item: "t2.micro"
}


variable "unique_azs" {
  type    = set(string)
  default = ["us-west-1a", "us-west-1b", "us-west-1a"]  # Duplicate values are ignored
}

output "unique_azs_output" {
  value = var.unique_azs  # Output: ["us-west-1a", "us-west-1b"]
}

variable "region_map" {
  type    = map(string)
  default = {
    us-east-1 = "US East (N. Virginia)"
    us-west-1 = "US West (N. California)"
  }
}

output "west_region" {
  value = var.region_map["us-west-1"]  # Accessing by key: "US West (N. California)"
}

variable "app_config" {
  type = object({
    environment = string
    instance_count = number
    enable_logging = bool
  })
  
  default = {
    environment   = "production"
    instance_count = 3
    enable_logging = true
  }
}

output "app_environment" {
  value = var.app_config.environment  # Accessing "production"
}

variable "mixed_tuple" {
  type    = tuple([string, number, bool])
  default = ["us-west-1", 2, true]
}

output "tuple_example" {
  value = var.mixed_tuple[1]  # Accessing the second element: 2
}

variable "servers" {
  type = list(object({
    name     = string
    cpu_core = number
    tags     = map(string)
  }))
  
  default = [
    {
      name     = "server-1"
      cpu_core = 2
      tags     = { Environment = "dev", Owner = "Alice" }
    },
    {
      name     = "server-2"
      cpu_core = 4
      tags     = { Environment = "prod", Owner = "Bob" }
    }
  ]
}

output "server_names" {
  value = [for server in var.servers : server.name]  # ["server-1", "server-2"]
}

variable "object1" {
    type = object({
      string1 = string
      number1 = number 
      tags = list(string)
    })
    default = {
    string1 = "shaik mujeer basha"
    number1 = 20000
    tags = ["mujeer", "muneer", "munaf"]
    }
  
}

output "objectoutput" {
    value = var.object1.string1
}

variable "mahin-1" {
    type = list(string)
    default = ["num", "num2", "num3"]
}

output "booll" {
    value = [ for bool in var.mahin-1 : bool ]
  
}

variable "test" {
    type = list(object({
      name = string 
      age = number
      names = list(string)
    }))
    default = [
  {
    name = "mujeer"
    age = 21 
    names = ["a", "b", "c"]

  },
  {
    name = "mona"
    age = 22
    names = ["d", "e", "f"]
  },
  {
    name = "mahin"
    age = 22
    names = ["g", "h", "i"]
  }
  ]
}

resource "local_file" "example-number_object" {
  for_each = { for namen in var.test : namen.name => namen.name }
  content  = "Hello, Terraform!"
  filename = "/tmp/${each.value}"

}



output "test_out_put" {
  
  value  = { for namen in var.test : namen.name => namen }
}


variable "a" {
  type = string
  default = "a"
}

output "a_value" {
  value = var.a
}

variable "b" {
  type = number
  default = 1
  
}
output "b_number" {
  value = var.b
  
}

variable "c_list_string" {
  type = list(string)
  default = ["a", "b", "c"]
  
}
output "c_list_string" {
  value = var.c_list_string[0]
  
}

variable "c_list_number" {
  type = list(number)
  default = [1, 2, 3]
  
}
output "c_list_num" {
  value = var.c_list_number[0]
  
}

variable "d" {
  type = list(map(string))
  default = [ { "name" = "mujeer" }, { "name2" = "mahin" } ]
  
}
output "d_val" {
  value = var.d[1]
  
}

variable "e" {
  type = list(bool)
  default = [ false, true ]
  
}
locals {
  name100 = var.f[0][0]
}

variable "f" {
  type = list(list(string))
  default = [ [ "mujeer", "mahin" ], ["mujeer", "hashmi"]]
}

output "f_value" {
  value = local.name100
}

variable "g" {
  type = map(string)
  default = {
    "a" = "mujeer"
    "b" = "mahin"
    "c" = "hashmi"
  }
}

output "g_value" {
  value = var.g.a
  
}

variable "h" {
  type = object({
    name = string
    number = number
    tags = map(string)
  })
  default = {
    name = "shaik"
    number = 72
    tags = {
      "env" = "dev"
      "cloud" = "aws"
      "project_number" = "22"
    }
  }
}

output "h_value" {
  value = var.h.name
  
}
variable "j" {
  type = list(string)
  default = [ "mahin", "riaan", "shaik" ]
}
output "j_value" {
  value = [ for j in var.j : j ]
}

variable "k"{
  default = ["web-server-1", "web-server-2", "db-server"]
}

output "k_value" {
  value = [for name in var.k : upper(name) ]
}

