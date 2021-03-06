name             'mdadm-conf'
maintainer       'Kirill Kouznetsov'
maintainer_email 'agon.smith@gmail.com'
license          'MIT'
description      'Installs mdadm and configures its own monitoring daemon.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

recipe 'mdadm', 'Install mdadm'

%w[debian ubuntu].each do |os|
  supports os
end

chef_version '< 16.0'

source_url 'https://github.com/evilmartians/chef-mdadm'
issues_url 'https://github.com/evilmartians/chef-mdadm/issues'
