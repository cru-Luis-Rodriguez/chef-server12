chef_server_fqdn = node['chef_server12']['backend']['fqdn']
chef_server_ipaddress = node['chef_server12']['backend']['ipaddress']
chef_server_hostname = hostname_from_fqdn(chef_server_fqdn)
analytics_fqdn = node['chef_server12']['backend']['analytics_fqdn']
analytics_ipaddress = node['chef_server12']['backend']['analytics_ipaddress']

template '/etc/hosts' do
  source 'hosts.server.erb'
  owner 'root'
  group 'root'
  mode 0644
  variables(
    chef_server_fqdn: chef_server_fqdn,
    chef_server_hostname: chef_server_hostname,
    chef_server_ipaddress: chef_server_ipaddress,
    analytics_fqdn: analytics_fqdn,
    analytics_ipaddress: analytics_ipaddress
  )
end
