#!/bin/bash

# Update package lists
sudo apt update

# Install Git
sudo apt install git -y

# Update package lists
sudo apt update

# Install ec2 Connect
sudo apt install ec2-instance-connect


# Verify installation
git --version

echo "Git installation complete!"