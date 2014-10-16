#
# Cookbook Name:: php-fpm
# Recipe:: service
#
# Copyright 2014, Aimluck,Inc.
#
# All rights reserved - Do Not Redistribute
#

service "php-fpm" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
