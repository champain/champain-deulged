require 'spec_helper'
describe 'deluged' do
  context 'with default values for all parameters' do
    it { should contain_class('deluged') }
  end
end
