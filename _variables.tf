variable "name" {
  type        = string
  description = "Load Balancer Name"
}

variable "environment" {
  type        = string
  description = "Environment (development, qa, live, etc.)"
  default     = "development"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID Load Balancer should be attached to"
}

variable "public" {
  type        = string
  description = "Define Load Balancer external (Internet) access"
  default     = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of Subnets Load Balancer should be attached to"
}

variable "https_only" {
  type        = bool
  description = "Define force HTTP to HTTPS redirect"
  default     = true
}

variable "acm_certificate_arn" {
  type        = string
  description = "Certificate ARN for HTTPS"
  default     = null
}
