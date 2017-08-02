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

resource "aws_s3_bucket_object" "infra-vpc" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "infrastructure/vpc.yaml"
  source = "../infrastructure/vpc.yaml"
  etag = "${md5(file("../infrastructure/vpc.yaml"))}"
}

