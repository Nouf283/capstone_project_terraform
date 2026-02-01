resource "aws_key_pair" "ec2_key" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}
