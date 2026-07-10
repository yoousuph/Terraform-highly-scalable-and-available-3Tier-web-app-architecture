locals {
  nginx_conf = templatefile("${path.module}/nginx.conf.tpl", {
    internal_alb_dns = aws_lb.priv_sub_alb.dns_name
  })
}