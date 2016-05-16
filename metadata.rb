name 'samba4'
maintainer 'Lyle Dietz'
maintainer_email 'ritterwolf@gmail.com'
license 'Apache 2.0'
description 'Install and configure Samba and its associated components'
version '0.1.0'
issues_url 'https://github.com/ritterwolf/chef-samba4/issues' if respond_to?(
  :issues_url)
source_url 'https://github.com/ritterwolf/chef-samba4' if respond_to?(
  :source_url)

depends 'apt', '~> 3.0.0'
depends 'dnf', '~> 0.1.2'
