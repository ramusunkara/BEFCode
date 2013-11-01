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
    it 'filters events where published is true' do
      sql = Event.published.to_sql
      expect(sql).to include %q(WHERE "events"."published" = 't')
    end
  end

  describe '.without' do
    let(:event) { create :event }
    it 'does stuff' do
      sql = Event.without(event).to_sql
      expect(sql).to include %Q(id != #{event.id})
    end
  end
end
