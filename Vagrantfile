$setup = <<SCRIPT
# Stop and remove any existing containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# Pull containers
docker pull postgres
docker pull kr1sp1n/docker-rails-blog:latest

# Build containers from Dockerfiles
#docker build -t postgres /app/docker/postgres
#docker build -t rails /app

# Run and link the containers
docker run -d --name postgres -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=docker postgres:latest
docker run -d --name rails -p 8080:3000 --link postgres:db kr1sp1n/docker-rails-blog:latest

#docker run -d -p 3000:3000 -v /app:/app --link redis:redis --link postgres:db --name rails rails:latest

SCRIPT

# Commands required to ensure correct docker containers
# are started when the vm is rebooted.
$start = <<SCRIPT
docker start postgres
docker start rails
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|

  # Setup resource requirements
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  # need a private network for NFS shares to work
  config.vm.network "private_network", ip: "192.168.50.4"

  # Rails Server Port Forwarding
  config.vm.network "forwarded_port", guest: 3000, host: 8080

  # Ubuntu
  config.vm.box = "ubuntu/trusty64"

  # Install latest docker
  config.vm.provision "docker"

  # Must use NFS for this otherwise rails
  # performance will be awful
  config.vm.synced_folder ".", "/app", type: "nfs"

  # Setup the containers when the VM is first
  # created
  config.vm.provision "shell", inline: $setup

  # Make sure the correct containers are running
  # every time we start the VM.
  config.vm.provision "shell", run: "always", inline: $start
end
