ActiveAdmin.register Person do
  member_action :update_from_linked_in, method: :post do
    person = Person.find(params[:id])
    if person.update_from_linkedin
      flash[:notice] = "Updated from LinkedIn"
    else
      flash[:alert] = "Error updating from LinkedIn"
    end

    redirect_to admin_person_path(person)
  end

  action_item only: [:show, :edit] do
    link_to('Update from LinkedIn', update_from_linked_in_admin_person_path(resource), method: :post)
  end

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
