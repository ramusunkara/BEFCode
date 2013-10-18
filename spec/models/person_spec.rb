require 'spec_helper'

describe Person do
  describe '#first_name' do
    it { should have_valid(:first_name).when 'x' }
    it { should_not have_valid(:first_name).when '', nil }
  end

  describe '#last_name' do
    it { should have_valid(:last_name).when 'x' }
    it { should_not have_valid(:last_name).when '', nil }
  end
end