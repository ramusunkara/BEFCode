class AddFieldsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :mentor, :boolean
    add_column :people, :board_member, :boolean
    add_column :people, :title, :string
    add_column :people, :organization, :string
    add_column :people, :linkedin_url, :string
  end
end
