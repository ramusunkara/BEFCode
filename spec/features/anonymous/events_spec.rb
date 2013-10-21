require 'spec_helper'

feature 'Anonymous visits' do
  scenario 'see a link to Events on the home page' do
    visit '/'

    expect(page).to have_link 'Events'
  end

  scenario 'can click the Events link' do
    visit '/'
    click_link 'Events'

    expect(current_path).to eq events_path
  end

  context 'when they visit the Events page' do
    before do
      create :event, title: 'Published', published: true
      create :event, title: 'Not published'
    end

    scenario 'they only see events published' do
      visit events_path

      expect(page).to have_content 'Published'
      expect(page).not_to have_content 'Not published'
    end
  end
end
