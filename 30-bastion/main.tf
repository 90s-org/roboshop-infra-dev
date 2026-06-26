resource "aws_instance" "bastion" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  subnet_id = local.default_subnet_1a
  vpc_security_group_ids = [local.bastion_sg_id]
  iam_instance_profile = aws_iam_instance_profile.bastion.name
  user_data = templatefile("bastion.sh.tftpl", {
    partition_number = 4
    extend_size_gb   = 30
  })

  root_block_device {
    volume_size = 50
    volume_type = "gp3"
    # EBS volume tags
    tags = merge(
      {
          Name = "${var.project}-${var.environment}-bastion"
      },
    local.common_tags
    )
  }

  tags = merge(
    {
        Name = "${var.project}-${var.environment}-bastion"
    },
    local.common_tags
  )
}