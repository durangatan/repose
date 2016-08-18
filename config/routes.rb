Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/users/:id' => 'users#show', as: 'profile'

root "root#index"

namespace :api do
	namespace :v1 do
		resources :events, only: [:create]
		resources :users, only: [:update, :create, :destroy] do 
      resources :events, only: :index
    end
		resources :sessions, only: [:create]
		end
	end
end
