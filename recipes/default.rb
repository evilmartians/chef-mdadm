#
# Cookbook Name:: mdadm
# Attributes:: default
#
# Author:: Kirill Kouznetsov <agon.smith@gmail.com>
#
# Copyright 2013, Kirill Kouznetsov
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

if ::File.exists? "/proc/mdstat" and not (::File.new('/proc/mdstat').readline() =~ /^Personalities :\s*$/)
  package "mdadm"

  service "mdadm" do
    action [ :enable, :start ]
  end

  template "/etc/default/mdadm" do
    owner "root"
    group "root"
    mode 0644
    source "default-mdadm.erb"
    variables(
      :initrdstart  => node['mdadm']['initrdstart'],
      :autostart    => node['mdadm']['autostart'],
      :autocheck    => node['mdadm']['autocheck'],
      :start_daemon => node['mdadm']['start_daemon'],
      :verbose      => node['mdadm']['verbose'],
      :mail_to      => node['mdadm']['mail_to']
    )
    notifies :run, "execute[generate mdadm.conf]", :immediately
  end

  execute "generate mdadm.conf" do
    command "/usr/share/mdadm/mkconf force-generate"
    action :nothing
    environment ({'MDADM_MAILADDR__' => node['mdadm']['mail_to']})
    user "root"
    notifies :restart, "service[mdadm]", :delayed
  end
end

# vim: ts=2 sts=2 sw=2 sta et
