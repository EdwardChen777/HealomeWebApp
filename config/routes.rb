Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'auth/sign_in', to: 'auth#sign_in', as: :login
  post 'auth/sign_out', to: 'auth#sign_out', as: :logout
end
