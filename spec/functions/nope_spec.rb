# frozen_string_literal: true

require 'spec_helper'

describe 'pfunc::nope' do
  context 'returns the parameter' do
    it { is_expected.to run.with_params('x').and_return('x') }
    it { is_expected.to run.with_params(['a']).and_return(['a']) }
    it { is_expected.to run.with_params(42).and_return(42) }
  end
end
