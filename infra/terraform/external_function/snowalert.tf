terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.34.0"
    }
    
    # snowflake = {
    #   source = "chanzuckerberg/snowflake"
    #   version = "0.24.0"
    # }
  
  }
}

provider "aws" {
  region = "us-west-2"
}



module "snowflake_api_integration_aws_gateway" {
  source                            = "./snowalert"
  prefix                            = "snowalert"
  # snowflake_integration_external_id = var.snowflake_integration_external_id
  snowflake_integration_user        = var.snowflake_integration_user
  aws_cloudwatch_metric_namespace   = var.aws_cloudwatch_metric_namespace
  aws_permission_boundry            = var.aws_permission_boundry
  aws_deployment_stage_name         = var.aws_deployment_stage_name
  gateway_logger_name               = var.gateway_logger_name
  gateway_caller_name               = var.gateway_caller_name
  aws_iam_role_policy_name          = var.aws_iam_role_policy_name
}

variable "aws_permission_boundry" {
  type        = string
  default     = null
}
variable "snowflake_integration_user" {
  type        = string
  description = "user who will be calling the API Gateway"
  default     = null
}

# variable "snowflake_integration_external_id" {
#   type        = string
#   description = "API_AWS_EXTERNAL_ID from DESC INTEGRATION ..."
#   default     = "000000"
# }

variable "aws_cloudwatch_metric_namespace" {
  type        = string
  description = "where EF can write CloudWatch Metrics"
  default     = "*"
}

variable "gateway_logger_name" {
  type        = string
  default     = "gateway_logger1"
}

variable "gateway_caller_name" {
  type        = string
  default     = "gateway_caller1"
}

variable "aws_iam_role_policy_name" {
  type        = string
  default     = "gateway_policy1"
}

variable "aws_deployment_stage_name" {
  type        = string
  default     = "prod"
}