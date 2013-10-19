require 'spec_helper'

feature 'Admin users' do
  scenario 'can create events' do
    user = create :admin_user

    login_admin user

    click_link 'Events'

    click_link_or_button 'New Event'

    fill_in 'Title', with: 'Event Title'

    within '#event_starts_at_input' do
      select '2014', from: 'Year'
      select 'January', from: 'Month'
      select '1', from: 'Day'
    end

    click_link_or_button 'Create Event'

    expect(page).to have_content 'Event was successfully created.'
  end
end
