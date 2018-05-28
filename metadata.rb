name             "mdadm"
maintainer       "Kirill Kouznetsov"
maintainer_email "agon.smith@gmail.com"
license          "MIT"
description      "Installs mdadm and configures its own monitoring daemon."
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "0.0.3"

recipe "mdadm", "Install mdadm"

%w[debian ubuntu].each do |os|
  supports os
end
