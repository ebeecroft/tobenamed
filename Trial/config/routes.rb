Trial::Application.routes.draw do

   #Builds the users actions and the nested actions
   resources :users, :except => [:new] do
      resources :petowners
      resources :inventories, :except =>[:show, :edit, :update]
      resources :comments, :only => [:create, :destroy, :index]
   end

   #Builds the pet and item actions
   resources :pets
   resources :items

   #Builds the equips and fights actions
   resources :petowners, :only =>[] do #Prevents building the petowners routes
      resources :equips, :except => [:edit, :update]
      resources :fights, :except => [:edit]
   end

   #Build the forum maintopics actions and the nested actions
   resources :maintopics do
      resources :subtopics
   end

   #Builds the forum narratives actions
   resources :subtopics, :only =>[] do #Prevents building the subtopics routes
      resources :narratives, :except => [:show]
   end

   #Creates the user connection to the website
   resources :sessions, :only => [:create]

   #Login pages + user signup
   get '/signup' => 'users#new'
   get '/signin' => 'sessions#new'
   match '/logout' => 'sessions#destroy', via: :delete #has to be a match condition

   #Root pages
   get 'about' => "start#about"
   get 'update' => "start#update"
   get 'contact' => "start#contact"
   root :to => "start#home"
end
