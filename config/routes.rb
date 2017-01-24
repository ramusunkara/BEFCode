BEF::Application.routes.draw do
  resources :events
  resources :people
  resources :distinguish_badgers, only: [:index, :show]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'mentors', to: 'people#mentors'
end
