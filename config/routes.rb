Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #for using devise authentication
  devise_for :users

  #create welcome page
  root 'welcome#index'
  #get 'about', to: 'pages#about'


end
