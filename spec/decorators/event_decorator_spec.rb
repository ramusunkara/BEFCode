require 'spec_helper'

describe EventDecorator do
  let(:event) { build :event }
  subject { event.decorate }

  describe '#starts_at' do
    let(:starts_at) { ActiveSupport::TimeZone.new('Pacific Time (US & Canada)').parse('1/1/2014 7:00 pm') }
    let(:event) { build :event, starts_at: starts_at }

    it 'is the expected format' do
      expect(subject.starts_at).to eq 'Wednesday January 1, 2014 7:00 pm'
    end
  end
end
