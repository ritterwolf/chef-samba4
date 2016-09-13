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

require 'serverspec'

set :backend, :exec

describe file '/etc/samba/smb.conf' do
  its(:content) { should match(/server role = member/) }
  its(:content) { should match(/security = ads/) }
  its(:content) { should match(/workgroup = KITCHEN/) }
  its(:content) { should match(/realm = KITCHEN\.TEST/) }
end

describe file '/var/lib/samba/private/krb5.conf' do
  it { should exist }
  it { should be_file }
end
