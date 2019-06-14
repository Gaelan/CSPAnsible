cd $(dirname "$0")
if ! [ -f configuration.yml ]; then
    cp configuration.example.yml configuration.yml
    echo "Please edit configuration.yml (for example, to add the list of students) then run this script again."
    exit
fi

if ! [ -x "$(command -v ansible-playbook)" ]; then
echo "Installing ansible..."
    sudo apt update
    sudo apt install -y software-properties-common
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible
fi
echo "Configuring server..."
sudo ansible-playbook ./class_server.yml
echo "Done."
