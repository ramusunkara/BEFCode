class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :starts_at, null: false
      t.datetime :publish_at
      t.string :title, null: false
      t.string :venue_name
      t.string :venue_street_address
      t.string :venue_city
      t.string :venue_state
      t.string :venue_zip

      t.timestamps
    end
  end
end
