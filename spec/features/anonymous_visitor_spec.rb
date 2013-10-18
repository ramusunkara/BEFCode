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
      expect(page).to have_content 'list of people'
    end
  end
end