class AddSpeakerToEvent < ActiveRecord::Migration
  def change
    add_column :events, :speaker, :string
  end
end
