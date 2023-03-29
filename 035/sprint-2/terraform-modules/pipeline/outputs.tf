output "sqs_arn" {
  value = aws_sqs_queue.new_order_queue.arn
}
