Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'home#index'
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/temp', to: 'home#temp', as: :temp
  get 'home/company', to: 'home#company', as: :company
  get 'home/how_it_works', to: 'home#how_it_works', as: :how_it_works
  get 'home/pricing', to: 'home#pricing', as: :pricing
  get 'home/blog', to: 'home#blog', as: :blog
  get 'home/dashboard', to: 'home#dashboard', as: :dashboard

  #post 'auth/sign_in', to: 'auth#sign_in', as: :login
  #post 'auth/sign_out', to: 'auth#sign_out', as: :logout

  get '/sign_in', as: 'signin', to: 'cognito#sign_in'
  get '/sign_out', as: 'signout', to: 'cognito#sign_out'
  get '/sign_up', as: 'signup', to: 'cognito#sign_up'

  get 'auth/sign_in', to: 'auth#signin', as: :auth_sign_in
  get 'auth/sign_out', to: 'auth#signout', as: :auth_sign_out

  resources :users

  #root to: 'home#index'

  post "checkout/create", to: "checkout#create"
  get "success", to: "checkout#success"
  get "cancel", to: "checkout#cancel"

  get 'show_items' => 'cart#show_items', as: :view_cart
  get 'cart/:id/add_item' => 'cart#add_item', as: :add_item
  get 'cart/:id/remove_item' => 'cart#remove_item', as: :remove_item
  get 'empty_cart' => 'cart#empty_cart', as: :empty_cart
  get 'checkout' => 'cart#checkout', as: :checkout

end
