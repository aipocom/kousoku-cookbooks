#
# Cookbook Name:: finalize
# Recipe:: core
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{mysql nginx}.each do |srv|
  service srv do
    action :stop
  end
end

case node["platform"]
when "amazon"
  execute "Cleanup keys, Chef recipe" do
    command <<-EOH
      echo -n > /home/ec2-user/.bash_history
      rm -rf /home/ec2-user/.ssh/known_hosts
      echo -n > /home/ec2-user/.ssh/authorized_keys
      rm -rf /home/ec2-user/chef-solo
      rm -f /home/ec2-user/install.sh
    EOH
  end
else
  execute "Cleanup keys, Chef recipe" do
    command <<-EOH
      echo -n > /home/chef-user/.bash_history
      rm -rf /home/chef-user/.ssh/known_hosts
      echo -n > /home/chef-user/.ssh/authorized_keys
      rm -rf /home/chef-user/chef-solo
      rm -f /home/chef-user/install.sh
    EOH
  end
end

execute "Cleanup logs, root keys" do
  command <<-EOH
find /var/log -type f -regex ".*\-[0-9]+$" -delete
echo -n > /root/.bash_history
rm -rf /root/.ssh/known_hosts
echo -n > /root/.ssh/authorized_keys
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
history -c
  EOH
end

