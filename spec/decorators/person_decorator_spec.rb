require 'spec_helper'

describe PersonDecorator do
  let(:person) { build :person }

  subject { person.decorate }

  describe '#full_name' do
    let(:person) { build :person, first_name: 'Bob', last_name: 'Smith' }

    it 'is the first and last name' do
      expect(subject.full_name).to eq 'Bob Smith'
    end
  end
end