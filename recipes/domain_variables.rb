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

# Here we define the variables required to create or join an Active Directory
# domain.

unless node.domain.nil?
  node.default['samba4']['globals']['realm'] = node['domain'].upcase
  node.default['samba4']['globals']['workgroup'] =
    node['samba4']['globals']['realm'].split('.')[0]
end
