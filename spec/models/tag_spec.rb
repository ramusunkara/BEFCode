require 'spec_helper'

describe Tag do
  it { should have_many(:roles) }
  it { should have_many(:people).through(:roles) }

  describe '#title' do
    it { should validate_uniqueness_of(:title) }

    it { should have_valid(:title).when 'x' }
    it { should_not have_valid(:title).when '', nil }
  end
end