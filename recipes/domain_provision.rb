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

# rubocop:disable Metrics/LineLength

admin_pass_item = Chef::EncryptedDataBagItem.load('samba4', 'Administrator')
admin_pass = admin_pass_item['password']

execute 'create-domain' do
  command "/usr/bin/samba-tool domain provision --use-rfc2307 --adminpass #{admin_pass} --realm #{node['samba4']['globals']['realm']} --domain #{node['samba4']['globals']['workgroup']}"
  creates '/var/lib/samba/private/krb5.conf'
end
