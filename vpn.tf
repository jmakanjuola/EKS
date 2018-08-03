resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "vpn_gw"
  }
}

resource "aws_customer_gateway" "demo_customer_gw" {
  bgp_asn    = 65000
  ip_address = "172.0.0.1"
  type       = "ipsec.1"
}

resource "aws_vpn_connection" "vpc_conn" {
  vpn_gateway_id      = "${aws_vpn_gateway.vpn_gw.id}"
  customer_gateway_id = "${aws_customer_gateway.demo_customer_gw.id}"
  type                = "ipsec.1"
  static_routes_only  = true

  tags {
    Name = "demo_vpn_conn"
  }
}
