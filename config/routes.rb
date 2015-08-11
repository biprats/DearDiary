Rails.application.routes.draw do
	root to: "thoughts#index", as: :thoughts
	resources :authors do
		resources :thoughts
	end
	resources :sessions, only: :create do
		delete "/", to: :destroy, on: :collection
	end
end