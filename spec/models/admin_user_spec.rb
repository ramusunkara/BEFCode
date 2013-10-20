require 'spec_helper'

describe AdminUser do
  it 'includes the expected Devise modules' do
    expected = [
      Devise::Models::DatabaseAuthenticatable,
      Devise::Models::Recoverable,
      Devise::Models::Rememberable,
      Devise::Models::Trackable,
      Devise::Models::Validatable
    ]

    expected.each do |expected_klass|
      match = described_class.ancestors.find { |klass| klass == expected_klass }
      expect(match).not_to be_nil
    end
  end
end
