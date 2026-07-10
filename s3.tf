resource "aws_s3_bucket" "s3_netflix_bucket" {
  bucket = "yoousuph-terraform-netflix-files"
}

// Sync web files from the local directory to the S3 bucket
resource "aws_s3_object" "web_files" {
  for_each = fileset("${path.module}/webapp/web", "**")

  bucket = aws_s3_bucket.s3_netflix_bucket.id

  key    = "web/${each.value}"
  source = "${path.module}/webapp/web/${each.value}"
  etag   = filemd5("${path.module}/webapp/web/${each.value}")
}

// Sync app files from the local directory to the S3 bucket
resource "aws_s3_object" "app_files" {
  for_each = fileset("${path.module}/webapp/app", "**")

  bucket = aws_s3_bucket.s3_netflix_bucket.id

  key    = "app/${each.value}"
  source = "${path.module}/webapp/app/${each.value}"
  etag   = filemd5("${path.module}/webapp/app/${each.value}")
}