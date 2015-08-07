Rails.application.routes.draw do
	root to: "thoughts#index", as: :thoughts
	resources :authors
	resources :thoughts
	

end
