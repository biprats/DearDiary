Rails.application.routes.draw do
	root to: "authors#index", as: :authors
	resources :authors
	resources :thoughts
	
	

end
