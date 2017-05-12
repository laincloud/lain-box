# vim: ft=ruby:

require 'yaml'

cur_path = File.expand_path(File.dirname(__FILE__))
cfg = YAML.load(File.open(File.join(cur_path, "config.yaml")))

Vagrant.configure(2) do |config|

  config.vm.box = "laincloud/lain-box"
  config.vm.hostname = "lain"
  config.vm.provider "virtualbox" do |v|
    v.cpus = cfg["cpus"]
    v.memory = cfg["memory"]
  end

  config.vm.network "private_network", ip: cfg["ip"], auto_config: false

  (cfg["apps"] || {}).each_pair do |name, path|
    config.vm.synced_folder File.expand_path(path), "/apps/#{name}"
  end

end

