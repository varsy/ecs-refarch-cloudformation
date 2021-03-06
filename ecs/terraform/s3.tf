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

resource "aws_s3_bucket_object" "infra-security-groups" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "infrastructure/security-groups.yaml"
  source = "../infrastructure/security-groups.yaml"
  etag = "${md5(file("../infrastructure/security-groups.yaml"))}"
}

resource "aws_s3_bucket_object" "infra-load-balancers" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "infrastructure/load-balancers.yaml"
  source = "../infrastructure/load-balancers.yaml"
  etag = "${md5(file("../infrastructure/load-balancers.yaml"))}"
}

resource "aws_s3_bucket_object" "infra-ecs-cluster" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "infrastructure/ecs-cluster.yaml"
  source = "../infrastructure/ecs-cluster.yaml"
  etag = "${md5(file("../infrastructure/ecs-cluster.yaml"))}"
}

resource "aws_s3_bucket_object" "infra-teamcity-server" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "teamcity/server.yaml"
  source = "../teamcity/server.yaml"
  etag = "${md5(file("../teamcity/server.yaml"))}"
}