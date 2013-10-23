class AddPhotoToPerson < ActiveRecord::Migration
  def change
    add_attachment :people, :photo
  end
end
