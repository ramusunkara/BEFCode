require 'spec_helper'

describe 'anonymous visitor' do
  context 'when they visit the home page' do
    it 'they should see "Badgers"' do
      visit '/'
      expect(page).to have_content 'Badgers'
    end
  end
end