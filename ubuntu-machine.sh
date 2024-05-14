# Ubuntu Machine prepare

sudo apt update -y && apt upgrade -y

sudo apt autoremove -y && apt clean -y

echo "Will install: make, docker, docker-compose, unzip, and build-essential"
echo "Install this things? [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "Installing..."
	sudo apt-get install ca-certificates curl gnupg
	install -m 0755 -d /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	chmod a+r /etc/apt/keyrings/docker.gpg
	echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
	  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
	  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt install install docker-ce docker-ce-cli containerd.io docker-buildx-plugin 
	sudo curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	sudo apt install -y make docker.io docker-compose unzip build-essential curl
	sudo groupadd docker
	sudo gpasswd -a $USER docker
	newgrp docker

	echo "Hello world from docker: "
	docker run hello-world
	sudo apt update -y && apt upgrade -y
	sudo apt autoremove -y && apt clean -y
else
	clear
	echo "Exiting"
fi
