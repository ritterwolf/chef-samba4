# Copyright 2016 Lyle Dietz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This recipe cannot be fully tested in the serverspec tests because it requires
# a domain controller to already exist.

include_recipe 'samba4::domain_variables'

node.default['samba4']['globals']['server_role'] = 'member'
node.default['samba4']['globals']['security'] = 'ads'
node.default['samba4']['winbind']['join_user'] = 'Administrator'

include_recipe 'samba4::default'

joiner = node['samba4']['winbind']['join_user']
joiner_pass = Chef::EncryptedDataBagItem.load('samba4', joiner)['password']

execute 'join-domain' do
  command "net ads join -U #{joiner}%#{joiner_pass}"
  # This looks funky, but it stops it waiting for input if we aren't
  # joined to the domain, and has no effect if we are
  not_if 'echo | net ads testjoin'
  notifies :restart, 'service[winbind]'
end

service 'winbind' do
  action [:enable, :start]
end
