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
    before do
      create :person, last_name: 'Adams'
    end

    it 'they should see Adams' do
      visit people_path
      expect(page).to have_content 'Adams'
    end
  end
end