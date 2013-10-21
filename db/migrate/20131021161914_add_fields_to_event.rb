class AddFieldsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :description, :text
    add_column :events, :host_name, :string
    add_column :events, :photo_album_url, :string
    add_column :events, :rsvp_url, :string
  end
end
