Rails.application.routes.draw do
  get 'product/index'
  get 'products', to: 'product#index'
  get 'products/new', to: 'product#new' 
  post '/products', to: 'product#create'
end
