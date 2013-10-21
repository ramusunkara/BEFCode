require 'spec_helper'

feature 'Admin users' do
  scenario 'can create events' do
    user = create :admin_user

    login_admin user

    click_link 'Events'

    click_link_or_button 'New Event'

    fill_in 'Title', with: 'Event Title'

    fill_in 'event[starts_at_date]', with: '2014-1-1'

    click_link_or_button 'Create Event'

    expect(page).to have_content 'Event was successfully created.'
  end
end
