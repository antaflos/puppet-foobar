# foobar

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with foobar](#setup)

## Description

Simple Puppet module to reproduce `pdk test unit` failing under Ubuntu 18.04
and probably other Debian-like operating systems with systemd.

## Setup

This is best tested under a fresh Vagrant-based Ubuntu 18.04 VM. You can use the following `Vagrantfile`:

```ruby
Vagrant.configure("2") do |config|
  config.vm.define 'bionic01' do |node|
    node.vm.box = "ubuntu/bionic64"
  end
end
``` 

Set up the Vagrant VM:

```
mkdir vagrant-foobar-pdktest
cd vagrant-foobar-pdktest
wget https://github.com/antaflos/puppet-foobar/Vagrantfile [TODO]
vagrant up
```

Once the Vagrant VM is up connect to it and set up Git, PDK and clone the Puppet module

```
vagrant ssh bionic01

apt-get update
apt-get install git
wget http://apt.puppet.com/pool/bionic/puppet/p/pdk/pdk_1.13.0.0-1bionic_amd64.deb
dpkg -i pdk_1.13.0.0-1bionic_amd64.deb
git clone https://github.com/antaflos/puppet-foobar
cd puppet-foobar
pdk test unit
```

Now you should see errors like the following:

```
pdk (INFO): Using Ruby 2.5.3
pdk (INFO): Using Puppet 6.8.1
[✔] Preparing to run the unit tests.
[✖] Running unit tests.
Run options: exclude {:bolt=>true}
  Evaluated 8 tests in 6.306665069 seconds: 4 failures, 0 pending.
failed: rspec: ./spec/classes/foobar_spec.rb:9: Could not find the daemon directory (tested [/etc/sv,/var/lib/service])
  foobar on ubuntu-16.04-x86_64 foobar class with default values for class paramters should compile into a catalogue without dependency cycles
  Failure/Error:

        context 'foobar class with default values for class paramters' do
          it { is_expected.to compile }
          it { is_expected.to contain_service('foobard').with_ensure('running') }
        end

failed: rspec: ./spec/classes/foobar_spec.rb:9: Could not find the daemon directory (tested [/etc/sv,/var/lib/service])
  foobar on debian-10-x86_64 foobar class with default values for class paramters should compile into a catalogue without dependency cycles
  Failure/Error:

        context 'foobar class with default values for class paramters' do
          it { is_expected.to compile }
          it { is_expected.to contain_service('foobard').with_ensure('running') }
        end

failed: rspec: ./spec/classes/foobar_spec.rb:9: Could not find the daemon directory (tested [/etc/sv,/var/lib/service])
  foobar on debian-9-x86_64 foobar class with default values for class paramters should compile into a catalogue without dependency cycles
  Failure/Error:

        context 'foobar class with default values for class paramters' do
          it { is_expected.to compile }
          it { is_expected.to contain_service('foobard').with_ensure('running') }
        end

failed: rspec: ./spec/classes/foobar_spec.rb:9: Could not find the daemon directory (tested [/etc/sv,/var/lib/service])
  foobar on ubuntu-18.04-x86_64 foobar class with default values for class paramters should compile into a catalogue without dependency cycles
  Failure/Error:

        context 'foobar class with default values for class paramters' do
          it { is_expected.to compile }
          it { is_expected.to contain_service('foobard').with_ensure('running') }
        end
```
