# frozen_string_literal: true

require 'spec_helper'

describe 'pfunc::md5' do
  context 'returns md5sum of string' do
    it { is_expected.to run.with_params('x').and_return('9dd4e461268c8034f5c8564e155c67a6') }
  end
end
