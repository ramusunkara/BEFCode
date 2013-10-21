ActiveAdmin.register Event do

  index do
    column :title
    column :starts_at
    column :published
    column :rsvp_url
    default_actions
  end
end
