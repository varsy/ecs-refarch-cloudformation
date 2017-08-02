resource "aws_s3_bucket" "cloudformation" {
  bucket = "tc-tf-test.jetbrains.com"
  acl = "public-read"
  force_destroy = true
}

resource "aws_s3_bucket_object" "master" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "master.yaml"
  source = "../master.yaml"
  etag = "${md5(file("../master.yaml"))}"
}