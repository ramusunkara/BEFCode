BEF::Application.routes.draw do
  resources :events
  resources :people

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'welcome#index'
  get 'contact', to: 'welcome#contact'
  get 'about', to: 'welcome#about'
  get 'mentors', to: 'people#mentors'
  get 'distinguish_badgers', to: 'people#distinguish_badgers'
end
