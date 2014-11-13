include_attribute "mysql::server"

default[:mysql][:percona_rpm] = "percona-release-0.1-3.noarch.rpm"
default[:mysql][:percona_rpm_uri] = "http://www.percona.com/redir/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm"
default[:mysql][:percona_package] = "Percona-XtraDB-Cluster-56"
default[:mysql][:percona_package_devel] = "Percona-XtraDB-Cluster-devel-56"
