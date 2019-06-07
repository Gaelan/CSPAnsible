cd $(dirname "$0")
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
