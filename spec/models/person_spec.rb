require 'spec_helper'

describe Person do
  it { should have_many(:roles) }
  it { should have_many(:tags).through(:roles) }

  it { should accept_nested_attributes_for :roles }

  describe '#first_name' do
    it { should have_valid(:first_name).when 'x' }
    it { should_not have_valid(:first_name).when '', nil }
  end

  describe '#last_name' do
    it { should have_valid(:last_name).when 'x' }
    it { should_not have_valid(:last_name).when '', nil }
  end

  describe '.for_tag_title' do
    context 'when tag_title is not present' do
      let(:tag_title) { nil }

      it 'does not filter by tags' do
        sql = Person.for_tag_title(tag_title).to_sql
        expect(sql).not_to include 'WHERE'
      end
    end

    context 'when tag_title is present' do
      let(:tag_title) { 'consultant' }

      it 'filters records with matching tags' do
        sql = Person.for_tag_title(tag_title).to_sql
        expect(sql).to include %q(WHERE "tags"."title" = 'consultant')
      end
    end
  end

  describe '#default_scope' do
    it 'orders by last_name' do
      sql = Person.all.to_sql
      expect(sql).to include %q(ORDER BY "people".last_name ASC)
    end
  end
end