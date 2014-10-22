#
# Cookbook Name:: finalize
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'finalize::core'

execute "Shoutdown" do
  command <<-EOH
halt
  EOH
end

