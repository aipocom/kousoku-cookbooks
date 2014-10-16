#
# Cookbook Name:: php55-fpm
# Recipe:: default
#
# Copyright 2014, Aimluck,Inc.
#
# All rights reserved - Do Not Redistribute
#

%w{php55 php55-mysqlnd php55-mbstring php55-xml php55-gd php55-mcrypt php55-pspell php55-pecl-imagick php55-fpm php55-pecl-memcache php55-devel php55-opcache php55-intl}.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

include_recipe 'php-fpm::config55'

