<<<<<<< HEAD
resource "aws_cloudtrail" "earnest-eks-cluster-cloudtrail" {
  name                          = "${var.trail_name}"
  s3_bucket_name                = "${aws_s3_bucket.earnest-eks-cloudtrail-bucket.id}"
=======
resource "aws_cloudtrail" "demo-eks-cluster-cloudtrail" {
  name                          = "${var.trail_name}"
  s3_bucket_name                = "${aws_s3_bucket.demo-eks-cloudtrail-bucket.id}"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  include_global_service_events = "${var.include_global_service_events}"
  is_multi_region_trail         = "${var.is_multi_region_trail}"

  #sns_topic_name = "${var.sns_topic_name}"
  tags {
    Name = "${var.trail_name}"
  }
}

<<<<<<< HEAD
resource "aws_s3_bucket" "earnest-eks-cloudtrail-bucket" {
=======
resource "aws_s3_bucket" "demo-eks-cloudtrail-bucket" {
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  bucket        = "${var.s3_bucket_name}"
  force_destroy = true

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
<<<<<<< HEAD
            "Resource": "arn:aws:s3:::earnest-eks-cloudtrail-bucket"
=======
            "Resource": "arn:aws:s3:::demo-eks-cloudtrail-bucket"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
<<<<<<< HEAD
            "Resource": "arn:aws:s3:::earnest-eks-cloudtrail-bucket/*",
=======
            "Resource": "arn:aws:s3:::demo-eks-cloudtrail-bucket/*",
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}
