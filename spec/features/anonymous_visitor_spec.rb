require 'spec_helper'

describe 'anonymous visitor' do
  context 'when they visit the home page' do
    it 'they should see "Badgers"' do
      visit '/'
      expect(page).to have_link 'Badgers'
    end

    it 'they should be able to navigate to the Badgers page' do
      visit '/'
      click_link 'Badgers'
      expect(current_path).to eq '/people'
    end
  end

  context 'when they visit the Badgers page' do
    let(:tag_titles) { %w(consultant faculty) }
    let(:tags) do
      tag_titles.map { |title| create :tag, title: title }
    end
    let(:lawyer_tag) { create :tag, title: 'lawyer' }
    let(:person) { create :person, last_name: 'Adams' }
    let(:lawyer) { create :person, last_name: 'Douglas' }

    before do
      tags.each do |tag|
        person.tags << tag
      end

      person.save!

      lawyer.tags << lawyer_tag
      lawyer.save!
    end

    it 'they should see Adams' do
      visit people_path
      expect(page).to have_content 'Adams'
    end

    context 'when selecting consultants' do
      it 'they should see Adams' do
        visit people_path(tag_title: 'consultant')

        expect(page).to have_content 'Adams'
      end
    end

    context 'when selecting faculty' do
      it 'they should see Adams' do
        visit people_path(tag_title: 'faculty')

        expect(page).to have_content 'Adams'
      end
    end

    context 'when selecting some other tag' do
      it 'they should not see Adams' do
        visit people_path(tag_title: 'lawyer')

        expect(page).not_to have_content 'Adams'
      end

      it 'they should see Douglas' do
        visit people_path(tag_title: 'lawyer')

        expect(page).to have_content 'Douglas'
      end
    end
  end
end