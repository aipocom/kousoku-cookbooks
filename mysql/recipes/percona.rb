remote_file "/tmp/#{node[:mysql][:percona_rpm]}" do
  source "#{node[:mysql][:percona_rpm_uri]}"
end

package "#{node[:mysql][:percona_rpm]}" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{node[:mysql][:percona_rpm]}"
end

execute "rewrite repo file" do
  command <<-EOH
    sed -i "s/\\$releasever/6Server/g" /etc/yum.repos.d/Percona.repo
  EOH
end

package "#{node[:mysql][:percona_package]}"
package "#{node[:mysql][:percona_package_devel]}"

template "/etc/init.d/mysql" do
  path "/etc/init.d/mysql"
  source "percona-init.d.erb"
  owner "root"
  group "root"
  mode 0755
end

include_recipe 'mysql::service'
include_recipe 'mysql::config'

service 'mysql' do
  action [:enable, :start]
end
