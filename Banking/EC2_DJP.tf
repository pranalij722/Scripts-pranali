resource "aws_instance" "Banking_Project_DJP_Instance" {
  count         = 2
  ami           = "ami-0522ab6e1ddcc7055"  # Replace with the latest Ubuntu 24.04 AMI ID
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.Banking_Project_Subnet.id

  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.Banking_Project_SG.id]

  tags = {
    Name = count.index == 0 ? "Jenkins_Docker_Prometheus" : "Grafana"
  }

  # User Data Script
  user_data = <<-EOF
    #!/bin/bash

    # Update package information
    apt-get update -y

    # Configure SSH
    sed -i 's/^#*PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config
    sed -i 's/^#*PubkeyAuthentication .*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
    sed -i 's/^#*PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config

    # Restart SSH service
    systemctl restart sshd

    # Update cloud settings for SSH
    sed -i 's/^#*PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
    systemctl restart sshd

    echo "SSH configuration updated: PasswordAuthentication enabled."


    # Variables
    USERNAME="devops"
    PASSWORD="devops"

    # Create the user
    useradd -m -s /bin/bash "$USERNAME"

    # Set the password for the user
    echo "$USERNAME:$PASSWORD" | chpasswd

    # Add the user to the sudoers file with NOPASSWD privilege
    echo "$USERNAME ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME
    echo "$USERNAME ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

    # Set permissions on the sudoers file
    chmod 440 /etc/sudoers.d/$USERNAME

    # Inform the user
    echo "User $USERNAME created with passwordless sudo access."

    # Switch to 'devops' user
    sudo -i -u devops bash << 'EOL'
    # Generate SSH keys (no passphrase)
    ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
    cd ~/.ssh/
    touch authorized_keys

    # change permissions
    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/authorized_keys
    EOL

    EOF

  key_name = "terraform"
}
