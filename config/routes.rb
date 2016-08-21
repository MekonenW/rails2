Rails.application.routes.draw do
  root 'sessions#new'

  get 'users/:id' => 'users#show'
  post 'users' => 'users#create'

  get 'sessions' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

  get 'ideas' => 'ideas#index'
  get 'ideas/:id' => 'ideas#show'

  post 'ideas'=> 'ideas#create'
  delete 'ideas/:id'=> 'ideas#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
