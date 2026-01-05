# frozen_string_literal: true

require 'spec_helper'

describe 'pfunc' do
  let :default_params do
    {}
  end

  shared_examples 'pfunc shared examples' do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_notify('pfunc::nope function result')
      .with_message('pfunc::nope function result: |test for doing nothing|')
    }
    it { is_expected.to contain_notify('pfunc::split function result')
      .with_message('pfunc::split function result: |[split, me, on, comma]|')
    }
    it { is_expected.to contain_notify('pfunc::join function result')
      .with_message('pfunc::join function result: |join,me,with,comma|')
    }
    it { is_expected.to contain_notify('pfunc::hex function result')
      .with_message('pfunc::hex function result: |0x2A|')
    }
  end

  on_supported_os.each do |_os, _os_facts|
    context 'with defaults' do
      let :params do
        default_params
      end

      it_behaves_like 'pfunc shared examples'
    end
  end
end
