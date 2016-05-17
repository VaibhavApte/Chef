#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install build Essential

package "build-essential" do
	action :install
end


#Install tcl

package "tcl8.5" do
	action :install
end

#Getting tar file of redis

execute "wget" do
	command "wget http://download.redis.io/releases/redis-stable.tar.gz"
end


execute '/tmp/redis-stable.tar.gz' do 
destination '/opt/my_app_path' # Will be created if missing 
owner 'root' 
group 'root' 
extract_list [ '*.conf' ] 
umask 002 # Will be applied to perms in archive 
action :extract 
end

#execute "extract" do
#	command "tar xzf redis-stable.tar.gz"
#	cwd "/redis-stable"
#end

execute "build" do
	command "make"
	cwd "/redis-stable"
end

execute "install" do
	command "make install"
	cwd "/redis-stable/utils"
end

execute "install" do
 command "echo -n | ./install_server.sh"
 cwd "/redis-stable/utils"
 action :nothing
end

service "redis" do
	action [:start,:enable]
end