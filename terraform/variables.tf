variable "aws_region" {
  description = "Região AWS para criar os recursos"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Nome único do bucket S3 (deve ser globalmente único na AWS)"
  type        = string
  default     = "nuxdiet-static-site"
}

variable "project_name" {
  description = "Nome do projeto usado nas tags dos recursos"
  type        = string
  default     = "nuxdiet"
}
