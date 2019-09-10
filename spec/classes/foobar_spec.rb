require 'spec_helper'

describe 'foobar' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'foobar class with default values for class paramters' do
        it { is_expected.to compile }
        it { is_expected.to contain_service('foobard').with_ensure('running') }
      end
    end
  end
end
