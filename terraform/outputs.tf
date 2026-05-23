output "s3_bucket_name" {
  description = "Nome do bucket S3 criado"
  value       = aws_s3_bucket.website.id
}

output "s3_website_endpoint" {
  description = "Endpoint do site estático no S3 (HTTP)"
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
}

output "cloudfront_domain" {
  description = "URL pública do site via CloudFront (HTTPS) — use esta"
  value       = "https://${aws_cloudfront_distribution.website.domain_name}"
}

output "cloudfront_id" {
  description = "ID da distribuição CloudFront (usado no deploy CI)"
  value       = aws_cloudfront_distribution.website.id
}
