ActiveAdmin.register Event do

      controller do
            def resource
                  Event.where(slug: params[:id]).first!
            end
      end

      form html: { multipart: true } do |f|
            f.inputs do
                  f.input :starts_at, :as => :just_datetime_picker
                  f.input :title
                  f.input :description, as: :html_editor
                  f.input :speaker
                  f.input :photo
                  f.input :venue_name
                  f.input :venue_street_address
                  f.input :venue_city
                  f.input :venue_state
                  f.input :venue_zip
                  f.input :host_name
                  f.input :photo_album_url
                  f.input :rsvp_url
                  f.input :published
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
