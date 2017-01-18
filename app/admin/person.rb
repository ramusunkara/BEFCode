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

  form do |f|
    f.inputs 'Details' do
      f.input :first_name
      f.input :last_name
      f.input :title
      f.input :organization
      f.input :linkedin_url
      f.input :photo
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

  sidebar "LinkedIn", only: [:edit, :show] do
    render :partial => "linkedin_sidebar", :locals => { :person => @person }
  end

  index do
    column :first_name
    column :last_name
    column :title
    column :organization
    column :linkedin_url
    actions
  end
end
