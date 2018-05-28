describe file('/etc/default/mdadm') do
  it { should be_allowed('read') }
  it { should be_file }
  its('content') { should match(/INITRDSTART='all'/) }
  its('content') { should match(/AUTOSTART=true/) }
  its('content') { should match(/AUTOCHECK=true/) }
end

describe service('mdadm') do
  it { should be_enabled }
  it { should be_running }
end
