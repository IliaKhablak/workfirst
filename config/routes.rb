Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  mount_devise_token_auth_for 'Admin', at: 'authAdm'
  as :admin do
  	get 'env' => 'products#env'
  end
  
  resources :buckets
  resources :products
end
