Trial::Application.routes.draw do

   resources :users do
      resources :petowners
      resources :inventories
   end

   resources :pets

   resources :maintopics do
      resources :subtopics
   end

   resources :subtopics, :only =>[] do #Prevents building the subtopics routes
      resources :narratives
   end

   resources :sessions, :only => [:new, :create, :destroy]

   match '/signup', to: 'users#new'
   match '/signin', to: 'sessions#new'
   match '/logout', to: 'sessions#destroy', via: :delete

   resources :comments

   resources :fights

   resources :pet_items

   resources :items

end
