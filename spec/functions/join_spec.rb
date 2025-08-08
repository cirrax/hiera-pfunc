# frozen_string_literal: true

require 'spec_helper'

describe 'pfunc::join' do
  context 'returns joined array' do
    it { is_expected.to run.with_params(%w[x y z]).and_return('x,y,z') }
    it { is_expected.to run.with_params(%w[x y z], ';').and_return('x;y;z') }
  end
end
