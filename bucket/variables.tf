variable gcp_region {
  description = "Region in which the bucket to be created"
  type = string
  default = "asia-south1"
   
}
variable gcp_project {
    description = "Project in which the bucket to be created"
    type = string
  
}
  
variable buckets {
    description = "Name of the bucket to be created"
    type = map(string)
    default = {}
 
}

variable name {
    description = "Name of the bucket to be created"
    type = string
  
}

