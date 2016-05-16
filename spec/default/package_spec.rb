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

describe 'samba4::default' do
  context 'on Centos 7.1' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
        platform: 'centos', version: '7.1.1503').converge(described_recipe)
    end

    it 'installs samba' do
      expect(chef_run).to install_package('samba')
    end
  end

  context 'on Fedora 23' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
        platform: 'fedora', version: '23').converge(described_recipe)
    end

    it 'installs samba' do
      expect(chef_run).to install_package('samba')
    end
  end

  context 'on Ubuntu 14.04' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
        platform: 'ubuntu', version: '14.04').converge(described_recipe)
    end

    it 'installs samba' do
      expect(chef_run).to install_package('samba')
    end
  end
end
