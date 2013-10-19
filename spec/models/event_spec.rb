require 'spec_helper'

describe Event do
  it { should have_valid(:starts_at).when Time.now }
  it { should_not have_valid(:starts_at).when '', nil, 'dog' }

  it { should have_valid(:title).when 'x' }
  it { should_not have_valid(:title).when '', nil }

  describe '#default_scope' do
    it 'orders by starts_at desc' do
      sql = Event.all.to_sql
      expect(sql).to include %q(ORDER BY events.starts_at desc)
    end
  end

  describe '.published' do
    before { Timecop.freeze(Time.utc(2013, 10, 19, 13, 21, 33)) }

    it 'filters events where publish_at is present and in the past' do
      sql = Event.published.to_sql

      expect(sql).to include %q(WHERE (publish_at is not null and publish_at <= '2013-10-19 13:21:33.000000'))
    end
  end
end
