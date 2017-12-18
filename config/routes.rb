Rails.application.routes.draw do


  get 'addresses/show'

  get 'addresses/delete'

  get 'addresses/edit'

  get 'addresses/update'

  get 'addresses/new'

  get 'addresses/create'

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'pages#home'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup',     to: 'users#new'

  resources :users, except: :new
  resources :people, except: [:index] do
    resources :phone_numbers, except: [:index, :show]
    resources :emails, except: [:index, :show]
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
