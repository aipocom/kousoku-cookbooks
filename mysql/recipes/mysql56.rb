case node["platform"]
when "centos"
  package "mysqlclient16" do
    action [:remove]
  end
end

remote_file "/tmp/#{node[:mysql][:mysql56_rpm]}" do
  source "#{node[:mysql][:mysql56_rpm_uri]}"
end

package "#{node[:mysql][:mysql56_rpm]}" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{node[:mysql][:mysql56_rpm]}"
end


%w{mysql-community-server mysql-community-client mysql-community-devel}.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

directory "#{node[:mysql][:logdir]}" do
  owner "mysql" 
  group "mysql" 
  recursive true
  mode 0755
  recursive true
end

template 'mysql configuration' do
  path value_for_platform(
    ['centos','redhat','fedora','amazon'] => {'default' => '/etc/my.cnf'},
    'default' => '/etc/mysql/my.cnf'
    )
  source 'my.cnf.erb'
  backup false
  owner 'root'
  group 'root'
  mode 0644
end

service 'mysqld' do
  service_name 'mysqld'
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
