resource "aws_s3_bucket" "cloudformation" {
  bucket = "tc-tf-test.jetbrains.com"
  acl = "public-read"
  force_destroy = true
}

resource "aws_s3_bucket_object" "master" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "master.yaml"
  source = "../ecs/master.yaml"
  etag = "${md5(file("../ecs/master.yaml"))}"
}

resource "aws_s3_bucket_object" "infra-vpc" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "infrastructure/vpc.yaml"
  source = "../ecs/infrastructure/vpc.yaml"
  etag = "${md5(file("../ecs/infrastructure/vpc.yaml"))}"
}

resource "aws_s3_bucket_object" "infra-security-groups" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "infrastructure/security-groups.yaml"
  source = "../ecs/infrastructure/security-groups.yaml"
  etag = "${md5(file("../ecs/infrastructure/security-groups.yaml"))}"
}

resource "aws_s3_bucket_object" "infra-load-balancers" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "infrastructure/load-balancers.yaml"
  source = "../ecs/infrastructure/load-balancers.yaml"
  etag = "${md5(file("../ecs/infrastructure/load-balancers.yaml"))}"
}

resource "aws_s3_bucket_object" "infra-ecs-cluster" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "infrastructure/ecs-cluster.yaml"
  source = "../ecs/infrastructure/ecs-cluster.yaml"
  etag = "${md5(file("../ecs/infrastructure/ecs-cluster.yaml"))}"
}

resource "aws_s3_bucket_object" "infra-rds" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "infrastructure/rds.yaml"
  source = "../ecs/infrastructure/rds.yaml"
  etag = "${md5(file("../ecs/infrastructure/rds.yaml"))}"
}

resource "aws_s3_bucket_object" "infra-teamcity-server" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "teamcity/server.yaml"
  source = "../ecs/teamcity/server.yaml"
  etag = "${md5(file("../ecs/teamcity/server.yaml"))}"
}

resource "aws_s3_bucket_object" "ec2-master" {
  bucket = "${aws_s3_bucket.cloudformation.bucket}"
  key = "ec2/master.yaml"
  source = "../ec2/master.yaml"
  etag = "${md5(file("../ec2/master.yaml"))}"
}