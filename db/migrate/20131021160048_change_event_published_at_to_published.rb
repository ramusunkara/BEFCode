class ChangeEventPublishedAtToPublished < ActiveRecord::Migration
  def change
    remove_column :events, :publish_at
    add_column :events, :published, :boolean
  end
end
