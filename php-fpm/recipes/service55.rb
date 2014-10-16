#
# Cookbook Name:: php55-fpm
# Recipe:: default
#
# Copyright 2014, Aimluck,Inc.
#
# All rights reserved - Do Not Redistribute
#

service "php-fpm-5.5" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

