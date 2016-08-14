Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/users/:id' => 'users#show', as: 'profile'

root "root#index"

namespace :api do 
	namespace :v1 do 
		resources :events, only: [:create]
		resources :users, only: [:show, :update, :create, :destroy]
		resources :sessions, only: [:create]
		end
	end
end
