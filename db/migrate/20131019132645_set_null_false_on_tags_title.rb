class SetNullFalseOnTagsTitle < ActiveRecord::Migration
  def change
    change_column :tags, :title, :string, null: false
  end
end
