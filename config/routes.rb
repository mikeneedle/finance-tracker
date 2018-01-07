Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #for using devise authentication
  #devise_for :users #standard devise being commented out to allow for customized user signup
  devise_for :users, :controllers => { :registrations => "user/registrations" }

  #create welcome page
  #root 'welcome#index'
  root 'users#my_portfolio'
  #get 'about', to: 'pages#about'

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  resources :user_stocks, only: [:create, :destroy]

end
