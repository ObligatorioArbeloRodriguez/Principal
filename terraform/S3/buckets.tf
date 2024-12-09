
resource "aws_s3_bucket" "frontend" {
  bucket = "my-frontend-${var.environment}"

  tags = {
    Name        = "React Frontend Bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  block_public_acls       = false  
  ignore_public_acls      = false  
  block_public_policy     = false  
  restrict_public_buckets = false 
}

resource "aws_s3_bucket_website_configuration" "frontend" {
  bucket = aws_s3_bucket.frontend.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "frontend_policy" {
  bucket = aws_s3_bucket.frontend.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.frontend.arn}/*"
      }
    ]
  })

  
}

resource "aws_s3_bucket_notification" "my_bucket_notification" {

  bucket = aws_s3_bucket.frontend.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.notify_lambda.arn
    events              = ["s3:ObjectCreated:*"]
  }
}

resource "aws_lambda_function" "notify_lambda" {

  function_name = "notificador-a-${var.environment}"
  filename      = "S3/lambda_function.zip"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  role          = "arn:aws:iam::${var.accountid}:role/LabRole"
  environment {
    variables = {
      TELEGRAM_TOKEN   = "8080658851:AAE66PdrBQVz-9-UhhiI0c3ASoVEWtAb1bk"
      TELEGRAM_CHAT_ID = "-4731668628"
    }
  }
}

resource "aws_lambda_permission" "allow_s3" {

  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.notify_lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.frontend.arn
}