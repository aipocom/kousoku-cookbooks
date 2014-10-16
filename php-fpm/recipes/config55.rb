include_recipe 'php-fpm::service55'

template 'php-fpm configuration' do
  path '/etc/php-fpm-5.5.conf'
  source 'php-fpm-5.5.conf.erb'
  backup false
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, "service[php-fpm-5.5]"
end

template 'php configuration' do
  path '/etc/php-5.5.ini'
  source 'php-5.5.ini.erb'
  backup false
  owner 'root'
  group 'root'
  mode 0644
  variables({
    :mbstring_encoding_translation_value => "On"
  })
  notifies :restart, "service[php-fpm-5.5]"
end

template 'php-fpm www configuration' do
  path '/etc/php-fpm-5.5.d/www.conf'
  source 'php-fpm-5.5-www.conf.erb'
  backup false
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, "service[php-fpm-5.5]"
end

template 'php-fpm init.d configuration' do
  path '/etc/init.d/php-fpm-5.5'
  source 'php-fpm-5.5-init.d.erb'
  backup false
  owner 'root'
  group 'root'
  mode 0755
  notifies :restart, "service[php-fpm-5.5]"
end

directory "/var/lib/php/session" do
  owner "root"
  group "nginx"
  recursive true
  mode 0775
end
