Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
   get "/" , {to: 'posts#index' , as: :root}
   resources :posts do 
   resources :comments, only: [:create, :destroy]
   end

   resources :users, only: [:new, :create]

   resource :sessions, only: [:new, :destroy, :create]
  
   get '/sign_up', to: "users#new"
   resources :users, only: [:create, :edit, :update, :destroy]

   get "/users/:id/change_password", { to: "users#password_edit", as: "edit_password" }
   patch "/users/:id/change_password", { to: "users#password_update", as: "update_password" }
end 