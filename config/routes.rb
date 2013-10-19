BEF::Application.routes.draw do
  resources :events
  resources :people

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'welcome#index'
end
