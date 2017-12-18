Rails.application.routes.draw do

  root 'pages#home'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup',     to: 'users#new'

  resources :users, except: :new
  resources :people, except: [:index] do
    resources :phone_numbers, except: [:index, :show]
    resources :emails, except: [:index, :show]
    resources :addresses, except: [:index, :show]
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
