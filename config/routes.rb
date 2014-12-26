Rails.application.routes.draw do

  root 'events#index'
  post 'windows/:id', to: 'windows#assign_user'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, :timeslots, :windows, :events
  resources :account_activations, only: :edit
  resources :password_resets, only: [:new, :create, :edit, :update]


# need to add nested resources for event/window http://guides.rubyonrails.org/routing.html#nested-resources

#Need to add admin namespace
      # namespace :admin do
      #   root to: "admin#index"
      # end
end
