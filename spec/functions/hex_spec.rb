# frozen_string_literal: true

require 'spec_helper'

describe 'pfunc::hex' do
  context 'returns the splitted string' do
    it { is_expected.to run.with_params(42).and_return('0x2A') }
  end
end
