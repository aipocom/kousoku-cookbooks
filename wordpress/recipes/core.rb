#
# Cookbook Name:: wordpress
# Recipe:: core
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/tmp/#{node[:wordpress][:instance_id]}" do
  owner "root"
  group "root"
  recursive true
  mode 0755
  recursive true
end

directory "/var/www/vhosts/#{node[:wordpress][:instance_id]}" do
  action :delete
  recursive true
end

directory "/var/www/vhosts/#{node[:wordpress][:instance_id]}" do
  owner "root"
  group "root"
  mode 0755
  recursive true
end

remote_file "/tmp/#{node[:wordpress][:instance_id]}/#{node[:wordpress][:archive]}" do
  source "#{node[:wordpress][:archive_uri]}"
end

execute "Extract file, deploy" do
  command <<-EOH
    tar -zxvf /tmp/#{node[:wordpress][:instance_id]}/#{node[:wordpress][:archive]} -C /tmp/#{node[:wordpress][:instance_id]}
    mv /tmp/#{node[:wordpress][:instance_id]}/#{node[:wordpress][:archive_dir]}/* /var/www/vhosts/#{node[:wordpress][:instance_id]}/
    rm -rf /tmp/#{node[:wordpress][:instance_id]}
  EOH
end

template "wp-config.php" do
  path "/var/www/vhosts/#{node[:wordpress][:instance_id]}/wp-config.php"
  source "wp-config.php.erb"
  owner "root"
  group "root"
  mode 0666
end

file "delete scripts-per-once" do
  path "/var/lib/cloud/sem/config_scripts_per_once.once"
  action :delete
end

