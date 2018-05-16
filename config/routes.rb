Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  mount_devise_token_auth_for 'Admin', at: 'authAdm'
  as :admin do
  	get 'env' => 'products#env'
  end
  post 'buckets/:id' => 'buckets#update'
  post 'buckets2/:id' => 'buckets#update2'
  post 'delFromBucket/:id' => 'buckets#delFromBucket'
  get 'products2' => 'products#index2'
  resources :buckets
  resources :products
  resources :orders
  post 'addProd' => 'orders#addProd'
  post 'remProd' => 'orders#remProd'
  post 'delProd' => 'orders#delProd'
  get 'cleanbucket/:id' => 'buckets#cleanbucket'
end
