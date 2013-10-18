class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :person_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
