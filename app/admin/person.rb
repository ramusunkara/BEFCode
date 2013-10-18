ActiveAdmin.register Person do
  form do |f|
    f.inputs 'Details' do
      f.input :first_name
      f.input :last_name
    end

    f.has_many :roles do |rf|
      rf.inputs 'Roles' do
        rf.input :tag
      end
    end

    f.actions
  end
end
