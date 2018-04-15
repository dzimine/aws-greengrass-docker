# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # config.vm.box = "williamyeh/ubuntu-trusty64-docker"
  config.vm.box = 'ubuntu/xenial64'

  # Easiest to install docker on vagrant box
  config.vm.provision "docker"

  # Switch the storage driver
  # per https://forums.aws.amazon.com/message.jspa?messageID=832291
  config.vm.provision "shell", inline: <<-SHELL
cat > /etc/docker/daemon.json << EOF
{
    "storage-driver":"devicemapper"
}
EOF
sudo systemctl restart docker
SHELL

end
