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
      Timecop.freeze(Time.utc(2013, 10, 19))

      create :event, title: 'Published a day ago', publish_at: 1.day.ago
      create :event, title: 'Publish a day from now', publish_at: 1.day.from_now
      create :event, title: 'Not published'
    end

    scenario 'they only see events published before now' do
      visit events_path

      expect(page).to have_content 'Published a day ago'
      expect(page).not_to have_content 'Published a day from now'
      expect(page).not_to have_content 'Not published'
    end
  end
end
