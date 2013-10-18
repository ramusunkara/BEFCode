BEF::Application.routes.draw do
  root 'welcome#index'
  resources :people
end
