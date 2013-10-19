require 'spec_helper'

feature 'Anonymous visitors' do
  scenario 'see a link to Badgers on the home page' do
    visit '/'

    expect(page).to have_link 'Badgers'
  end

  scenario 'can click the Badgers link' do
    visit '/'
    click_link 'Badgers'

    expect(current_path).to eq people_path
  end

  context 'when they visit the Badgers page' do
    before do
      create :person, :with_tags, last_name: 'Adams', tags: %w(Consultants Faculty)
      create :person, :with_tags, last_name: 'Douglas', tags: %w(Lawyers)
    end

    scenario 'they should see Adams and Douglas' do
      visit people_path

      expect(page).to have_content 'Adams'
      expect(page).to have_content 'Douglas'
    end

    context 'and they select Consultants' do
      scenario 'they should see Adams but not Douglas' do
        visit people_path(tag_title: 'Consultants')

        expect(page).to have_content 'Adams'
        expect(page).not_to have_content 'Douglas'
      end
    end

    context 'and they select Faculty' do
      scenario 'they should see Adams but not Douglas' do
        visit people_path(tag_title: 'Consultants')

        expect(page).to have_content 'Adams'
        expect(page).not_to have_content 'Douglas'
      end
    end

    context 'and they select Lawyers' do
      scenario 'they should see Douglas but not Adams' do
        visit people_path(tag_title: 'Lawyers')

        expect(page).to have_content 'Douglas'
        expect(page).not_to have_content 'Adams'
      end
    end
  end
end
