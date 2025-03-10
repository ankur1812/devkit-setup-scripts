# Install docker 
curl -fsSL https://get.docker.com | bash

# # Alternate approach: Download the script first and then run it with bash.
# curl -fsSL https://get.docker.com -o install-docker.sh
# bash install-docker.sh  # (Run it safely)

# # Testing docker:
# sudo docker run hello-world
# sudo systemctl start docker # Start docker
# sudo systemctl enable docker # Auto start on boot


# # Install docker-compose
# # Docker v20.10+ has Docker Compose included as a plugin
sudo apt update
sudo apt install -y docker-compose-plugin

