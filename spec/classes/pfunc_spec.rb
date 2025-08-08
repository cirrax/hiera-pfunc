require 'spec_helper'

describe 'pfunc' do
  let :default_params do
    { }
  end

  shared_examples 'pfunc shared examples' do
    it { is_expected.to compile.with_all_deps }
  end

  on_supported_os.each do |os, os_facts|

  context 'with defaults' do
        let :params do
          default_params
        end

        it_behaves_like 'pfunc shared examples'

      end

  end
end

