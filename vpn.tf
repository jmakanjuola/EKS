<<<<<<< HEAD
resource "aws_vpn_gateway" "earnest-eks-vpn-gw" {
  vpc_id = "${aws_vpc.earnest-eks-vpc.id}"

  tags {
    Name = "earnest-eks-vpn-gw"
  }
}

resource "aws_customer_gateway" "earnest-eks-customer-gw" {
=======
resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "vpn_gw"
  }
}

resource "aws_customer_gateway" "demo_customer_gw" {
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  bgp_asn    = 65000
  ip_address = "172.0.0.1"
  type       = "ipsec.1"
}

<<<<<<< HEAD
resource "aws_vpn_connection" "earnest-eks-vpc-conn" {
  vpn_gateway_id      = "${aws_vpn_gateway.earnest-eks-vpn-gw.id}"
  customer_gateway_id = "${aws_customer_gateway.earnest-eks-customer-gw.id}"
=======
resource "aws_vpn_connection" "vpc_conn" {
  vpn_gateway_id      = "${aws_vpn_gateway.vpn_gw.id}"
  customer_gateway_id = "${aws_customer_gateway.demo_customer_gw.id}"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  type                = "ipsec.1"
  static_routes_only  = true

  tags {
<<<<<<< HEAD
    Name = "earnest-eks-vpn-conn"
=======
    Name = "demo_vpn_conn"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  }
}
