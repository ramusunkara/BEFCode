BEF::Application.routes.draw do
  resources :people

  root 'welcome#index'
end