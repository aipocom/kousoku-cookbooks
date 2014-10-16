require 'openssl'

root_pw = String.new
while root_pw.length < 20
  root_pw << OpenSSL::Random.random_bytes(1).gsub(/\W/, '')
end

default[:wordpress][:instance_id] = "wordpress"

default[:wordpress][:archive] = "wordpress-4.0-ja.tar.gz"
default[:wordpress][:archive_dir] = "wordpress"
default[:wordpress][:archive_uri] = "http://ja.wordpress.org/wordpress-4.0-ja.tar.gz"
