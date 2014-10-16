#
# Cookbook Name:: finalize
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "Cleanup logs" do
  command <<-EOH
service mysql stop
service nginx stop

find /var/log -type f -regex ".*\-[0-9]+$" -delete
echo -n > /root/.bash_history
echo -n > /home/chef-user/.bash_history
rm -rf /home/chef-user/.ssh/known_hosts
rm -rf /root/.ssh/known_hosts

echo -n > /root/.ssh/authorized_keys
echo -n > /home/chef-user/.ssh/authorized_keys
echo -n > /var/log/boot.log
echo -n > /var/log/btmp
echo -n > /var/log/cron
echo -n > /var/log/dmesg
echo -n > /var/log/dmesg.old
echo -n > /var/log/lastlog
echo -n > /var/log/maillog
echo -n > /var/log/messages
echo -n > /var/log/secure
echo -n > /var/log/spooler
echo -n > /var/log/tallylog
echo -n > /var/log/wtmp
echo -n > /var/log/yum.log
echo -n > /var/log/audit/audit.log

rm -rf /home/chef-user/chef-solo
rm -f /home/chef-user/install.sh

history -c
halt
  EOH
end

