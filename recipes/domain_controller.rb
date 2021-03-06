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

include_recipe 'samba4::domain_variables'

node.default['samba4']['globals']['server_role'] = 'dc'

node.default['samba4']['shares']['sysvol']['path'] = '/var/lib/samba/sysvol'
node.default['samba4']['shares']['netlogon']['path'] =
  "#{node['samba4']['shares']['sysvol']['path']}/#{node['samba4']['globals']['realm'].downcase}/scripts" # rubocop:disable Metrics/LineLength

include_recipe 'samba4::default'

# TODO: search DNS for our domain, and join it if it exists.
include_recipe 'samba4::domain_provision'
