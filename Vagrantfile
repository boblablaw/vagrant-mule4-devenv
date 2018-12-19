Vagrant.configure("2") do |config|

  config.vm.box = "debian/stretch64"
  config.vm.box_download_insecure=true
  config.vm.post_up_message = "If this is your first time running 'vagrant up' please run 'vagrant reload'."
  config.vm.hostname = "mulehost"

  file_to_disk = File.realpath( "." ).to_s + "/disk.vdi"

  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.name = "mulehost"
    v.memory = 4096
    v.customize ["modifyvm", :id, "--clipboard", "bidirectional", "--vram", "12"]
  end

  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network :forwarded_port, guest: 8081, host: 4567
end
