#
# Cookbook Name:: httpauth
# Recipe:: default
#
sysadmins = search(:users, 'groups:sysadmin')

template "/etc/nginx/htpasswd.users" do
  source "nginx/htpasswd.users.erb"
  owner node['staging']['nginx']['user']
  group node['staging']['nginx']['user']
  mode "0640"
  variables(
    :sysadmins => sysadmins
  )
  notifies :restart, "service[nginx]", :delayed
end

