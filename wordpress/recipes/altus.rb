#
# Cookbook Name:: wordpress
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'wordpress::core'

execute "change permission" do
  command <<-EOH    
    chown nginx:nginx -R /var/www/vhosts/#{node[:wordpress][:instance_id]}
  EOH
end

template "instance-initialize.sh" do
  path "/var/www/vhosts/#{node[:wordpress][:instance_id]}/instance-initialize.sh"
  source "altus-instance-initialize.sh.erb"
  owner "root"
  group "root"
  mode 0755
end

include_recipe "nginx::service"

template "www.conf" do
  path "/etc/nginx/conf.d/www.conf"
  source "nginx-www.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[nginx]"
end

template "rc.local" do
  path "/etc/rc.d/rc.local"
  source "rc.local.erb"
  owner "root"
  group "root"
  mode 0755
end
