output "sqs_arn" {
  description = "ARN of SQS"
  value       = aws_sqs_queue.sqs.arn
}
