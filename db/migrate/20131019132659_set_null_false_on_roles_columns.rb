class SetNullFalseOnRolesColumns < ActiveRecord::Migration
  def change
    change_column :roles, :person_id, :integer, null: false
    change_column :roles, :tag_id, :integer, null: false
  end
end
