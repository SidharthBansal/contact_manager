Rails.application.routes.draw do



  root 'people#index'

  resources :people, except: [:index]
  resources :phone_numbers, except: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
