ActiveAdmin.register DistinguishBadger do
  member_action :update_from_linked_in, method: :post do
    distinguish_badger = DistinguishBadger.find(params[:id])
    if distinguish_badger.update_from_linkedin
      flash[:notice] = "Updated from LinkedIn"
    else
      flash[:alert] = "Error updating from LinkedIn"
    end

    redirect_to admin_distinguish_badger_path(distinguish_badger)
  end

  form do |f|
    f.inputs 'Details' do
      f.input :first_name
      f.input :last_name
      f.input :date
      f.input :organization
      f.input :designation
      f.input :linkedin_url
      f.input :philanthropy_url
      f.input :biography
      f.input :photo
    end
    f.actions
  end

  sidebar "LinkedIn", only: [:edit, :show] do
    render :partial => "admin/people/linkedin_sidebar", :locals => { :distinguish_badger => @distinguish_badger }
  end

  index do
    column :first_name
    column :last_name
    column :organization
    column :linkedin_url
    column :date
    column :philanthropy_url
    
    actions
  end
end
