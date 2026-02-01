# -------------------------------
# RDS Subnet Group
# -------------------------------
resource "aws_db_subnet_group" "rds_subnets" {
  name       = "rds-subnet-group"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name = "rds-subnet-group"
  }
}

# -------------------------------
# RDS SQL Server Instance
# -------------------------------
resource "aws_db_instance" "sql_server_free" {
  identifier             = "my-sqlserver-free"
  engine                 = "sqlserver-ex"
  engine_version         = "15.00.4073.23.v1" # latest Express
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = "helloworld"
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.rds_subnets.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  multi_az                = false
  publicly_accessible     = false
  skip_final_snapshot     = true
  backup_retention_period = 0 # disables automated backups
}
