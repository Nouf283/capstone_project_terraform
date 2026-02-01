#master
resource "aws_instance" "k8s_master" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "m7i-flex.large"
  subnet_id              = aws_subnet.private[0].id
  key_name               = aws_key_pair.ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.k8s_sg.id]

  user_data = file("userdata/master.sh")

  root_block_device {
    volume_size = 30
  }

  ebs_block_device {
    device_name = "/dev/xvdb"
    volume_size = 20
    volume_type = "gp3"
  }

  tags = { Name = "k8s-master" }
}


#worker

resource "aws_instance" "k8s_workers" {
  count                  = 2
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "m7i-flex.large"
  subnet_id              = aws_subnet.private[count.index].id
  key_name               = aws_key_pair.ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.k8s_sg.id]

  root_block_device {
    volume_size = 30
  }

  ebs_block_device {
    device_name = "/dev/xvdb"
    volume_size = 20
    volume_type = "gp3"
  }

  user_data = file("userdata/worker.sh")

  tags = { Name = "k8s-worker-${count.index + 1}" }
}

