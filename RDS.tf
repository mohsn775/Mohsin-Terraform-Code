# resource "aws_db_instance" "myrds" {
#    db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
#    vpc_security_group_ids = [aws_security_group.rds_security_group.id]
#    allocated_storage   = 20
#    storage_type        = "gp2"
#    identifier          = "rdstf"
#    engine              = "mysql"
#    engine_version      = "8.0.35"
#    instance_class      = "db.t2.micro"
#    username            = "admin"
#    password            = "Passw0rd!123"
#    publicly_accessible = true
#    skip_final_snapshot = true
     

#    tags = {
#      Name = "MyRDS"
#    }
#  }
 

