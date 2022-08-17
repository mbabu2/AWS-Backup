resource "aws_route53_zone" "flink_aws" {
  name = "flinkaws.com"

  tags = {
    Environment = "core"
  }
}

resource "aws_route53_record" "www" {
 zone_id = aws_route53_zone.flink_aws.zone_id
 name    = "www.flinkaws.com"
 type    = "A"
  ttl     = "300"
  records = [aws_eip.eip.public_ip]
}

output "name_server"{
  value=aws_route53_zone.flink_aws.name_servers
}
