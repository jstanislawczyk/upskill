resource "aws_sqs_queue_policy" "orders_to_process_subscription" {
  queue_url = aws_sqs_queue.new_order_queue.id
  policy    = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "sns.amazonaws.com"
      },
      "Action": [
        "sqs:SendMessage"
      ],
      "Resource": [
        "${aws_sqs_queue.new_order_queue.arn}"
      ],
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.new_order_topic.arn}"
        }
      }
    }
  ]
}
EOF
}
