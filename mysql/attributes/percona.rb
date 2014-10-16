include_attribute "mysql::server"

default[:mysql][:percona_rpm] = "percona-release-0.0-1.x86_64.rpm"
default[:mysql][:percona_rpm_uri] = "http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm"
default[:mysql][:percona_package] = "Percona-XtraDB-Cluster-56"
default[:mysql][:percona_package_devel] = "Percona-XtraDB-Cluster-devel-56"
