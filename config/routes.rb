Rails.application.routes.draw do


  root 'pages#home'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup',     to: 'users#new'

  resources :users, except: :new
  resources :people, except: [:index]
  resources :phone_numbers, except: [:index, :show]
  resources :emails, except: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
