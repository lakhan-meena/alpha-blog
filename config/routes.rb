Rails.application.routes.draw do
	root 'home#index'
	resources :articles
	resources :users, except: [:new]
	get '/sign_up', to: 'users#new'
	get '/sign_in', to: 'sessions#new'
	post '/sign_in', to: 'sessions#create'
	delete '/sign_out', to: 'sessions#destroy'
end
