// create s3 bucket 
resource "aws_s3_bucket" "my_bucket" {
  bucket = "yoousuph-terraform-netflix-files-bucket"
}

// uploads files into the s3 bucket
resource "aws_s3_object" "web_files" {
  for_each = fileset("web_app", "**")

  bucket = aws_s3_bucket.my_bucket.id
  key    = each.value
  source = "web_app/${each.value}"

  etag = filemd5("web_app/${each.value}")
}