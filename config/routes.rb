Rails.application.routes.draw do
  resources :movies
  devise_for :users
   get 'admin', to: 'movies#new', as: 'admin'
   get 'user_exist/:username', to: 'user_apis#user_exist'
	 get 'get_movies_list', to: 'user_apis#get_movies_list'
	 get 'mark_as_favourite/:username/:movie_id', to: 'user_apis#mark_as_favourite'
   get 'fav_list_movies/:username', to: 'user_apis#fav_list_movies'
   get 'create_user/:username', to: 'user_apis#create_user'


   



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
