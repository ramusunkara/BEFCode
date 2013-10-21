ActiveAdmin.register Event do

  form do |f|
    f.inputs do
      f.input :starts_at, :as => :just_datetime_picker
      f.input :title
      f.input :description
      f.input :venue_name
      f.input :venue_street_address
    end

    f.actions
  end

  index do
    column :title
    column :starts_at
    column :published
    column :rsvp_url
    default_actions
  end
end
