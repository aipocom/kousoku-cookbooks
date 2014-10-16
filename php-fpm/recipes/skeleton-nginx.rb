#
# Cookbook Name:: php-fpm
# Recipe:: skeleton-nginx
#
# Copyright 2014, Aimluck,Inc.
#
# All rights reserved - Do Not Redistribute
#

template 'www.conf' do
  path "/etc/nginx/conf.d/www.conf" 
  source "nginx-www.conf.erb" 
  owner "root" 
  group "root" 
  mode 0644
end

service "nginx" do
  action:restart
end

