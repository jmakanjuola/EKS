resource "aws_cloudtrail" "earnest-eks-cluster-cloudtrail" {
  name                          = "${var.trail_name}"
  s3_bucket_name                = "${aws_s3_bucket.earnest-eks-cloudtrail-bucket.id}"
  include_global_service_events = "${var.include_global_service_events}"
  is_multi_region_trail         = "${var.is_multi_region_trail}"

  #sns_topic_name = "${var.sns_topic_name}"
  tags {
    Name = "${var.trail_name}"
  }
}

resource "aws_s3_bucket" "earnest-eks-cloudtrail-bucket" {
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
            "Resource": "arn:aws:s3:::earnest-eks-cloudtrail-bucket"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::earnest-eks-cloudtrail-bucket/*",
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
