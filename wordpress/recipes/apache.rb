#
# Cookbook Name:: wordpress
# Recipe:: apache
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'wordpress::core'

execute "change permission" do
  command <<-EOH    
    chown apache:apache -R /var/www/vhosts/#{node[:wordpress][:instance_id]}
  EOH
end

template "instance-initialize.sh" do
  path "/var/lib/cloud/scripts/per-once/instance-initialize.sh"
  source "instance-initialize-apache.sh.erb"
  owner "root"
  group "root"
  mode 0744
end

template "www.conf" do
  path "/etc/httpd/conf.d/www.conf"
  source "apache-www.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

service "httpd" do
  action :restart
end

