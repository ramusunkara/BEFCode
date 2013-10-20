ActiveAdmin.register Person do
  form do |f|
    f.inputs 'Details' do
      f.input :first_name
      f.input :last_name
      f.input :title
      f.input :organization
      f.input :linkedin_url
      f.input :mentor
      f.input :board_member
    end

    f.has_many :roles do |rf|
      rf.inputs 'Roles' do
        rf.input :tag
      end
    end

    f.actions
  end

  index do
    column :first_name
    column :last_name
    column :title
    column :organization
    column :linkedin_url
    default_actions
  end
end
