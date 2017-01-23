class CreateDistinguishBadgers < ActiveRecord::Migration
  def change
    create_table :distinguish_badgers do |t|
    	t.string :first_name
    	t.string :last_name
    	t.date :date
    	t.attachment :photo
    	t.string :organization
    	t.string :designation
    	t.string :linkedin_url
    	t.string :philanthropy_url
    	t.text :biography	 
      t.timestamps null: false
    end
  end
end
