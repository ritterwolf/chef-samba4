Samba4 cookbook
===============

This cookbook is for deploying Samba 4. It was created because I needed to be
able to deploy Linux workstations that authenticated against Active Directory.

In order to be able to test the cookbook, I also needed to be able to deploy
Active Directory.

This is a re-write of a cookbook that I never previously made publicly
available. I needed to greatly improve the testing, and split the
Vagrant/serverspec integration tests out in to another repository.

This is still a work in progress, and is not currently very usable.

Supports
--------

- Centos 7 (partial, can't provision a domain yet)
- Ubuntu 14.04

I plan on supporting the following as well:
- Fedora 23+; requires support in Chef for installing packages using DNF.
- Ubuntu 16.04; should work, but requires Fauxhi support for Chefspec testing.

Testing
-------

I don't test the domain_member cookbook with test-kitchen because I need a
domain controller for it to authenticate against and join. There will be a
test harness for this using Vagrant and serverspec.

License
=======

Copyright 2016 Lyle Dietz

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
