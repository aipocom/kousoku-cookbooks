template 'php-fpm configuration' do
  path '/etc/php-fpm.conf'
  source 'php-fpm.conf.erb'
  backup false
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, "service[php-fpm]"
end

template 'php configuration' do
  path '/etc/php.ini'
  source 'php.ini.erb'
  backup false
  owner 'root'
  group 'root'
  mode 0644
  variables({
    :mbstring_encoding_translation_value => "On"
  })
  notifies :restart, "service[php-fpm]"
end

template 'php-fpm www configuration' do
  path '/etc/php-fpm.d/www.conf'
  source 'php-fpm-www.conf.erb'
  backup false
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, "service[php-fpm]"
end

directory "/var/lib/php/session" do
  owner "root"
  group "nginx"
  recursive true
  mode 0775
end
