# Ubuntu Machine prepare

sudo su

apt update -y && apt upgrade -y

apt autoremove -y && apt clean -y

echo "Will install: make, docker, docker-compose, unzip
echo "Install this things? [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "Installing..."
		apt install -y make docker.io docker-compose unzip build-essential curl
else
		clear
		"Exiting
fi