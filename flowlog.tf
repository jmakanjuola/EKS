resource "aws_flow_log" "demo-eks-flowlog" {
    log_group_name = "${aws_cloudwatch_log_group.demo-eks-flowlog-group.name}"
    iam_role_arn ="${aws_iam_role.demo-eks-flowlog-role.arn}"
    vpc_id = "${aws_vpc.vpc.id}"
    traffic_type = "ALL"

}

resource "aws_cloudwatch_log_group" "demo-eks-flowlog-group" {
  name = "demo-eks-flowlog-group"

}



resource "aws_iam_role" "demo-eks-flowlog-role" {
  name = "demo-eks-flowlog-role"
  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Sid": "",
     "Effect": "Allow",
     "Principal": {
       "Service": "vpc-flow-logs.amazonaws.com"
     },
     "Action": "sts:AssumeRole"
   }
 ]
}
EOF
}



resource "aws_iam_role_policy" "demo-eks-flowlog-policy" {
  name = "demo-eks-flowlog-policy"
  role = "${aws_iam_role.demo-eks-flowlog-role.id}"
  policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": [
       "logs:CreateLogGroup",
       "logs:CreateLogStream",
       "logs:PutLogEvents",
       "logs:DescribeLogGroups",
       "logs:DescribeLogStreams"
     ],
     "Effect": "Allow",
     "Resource": "*"
   }
 ]
}
EOF
}
