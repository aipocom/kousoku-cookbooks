include_attribute "mysql::server"

default[:mysql][:mysql56_rpm] = "mysql-community-release-el6-5.noarch.rpm"
default[:mysql][:mysql56_rpm_uri] = "http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm"
