service 'mysql' do
  service_name 'mysql'
  supports :status => true, :restart => true, :reload => true
  action :nothing
end
