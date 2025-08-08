# frozen_string_literal: true

require 'spec_helper'

describe 'pfunc::split' do
  context 'returns the splitted string' do
    it { is_expected.to run.with_params('x,y,z').and_return(%w[x y z]) }
    it { is_expected.to run.with_params('x;y;z', ';').and_return(%w[x y z]) }
  end
end
