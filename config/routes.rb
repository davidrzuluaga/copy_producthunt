Rails.application.routes.draw do
  get 'product/index'
  get 'products', to: 'product#index'
  get 'products/new', to: 'product#new' 
  post '/products', to: 'product#create'
  get 'products/:id', to: 'product#show', as: 'product'
  get '/products/:id/edit', to: 'product#edit'
  patch '/products/:id', to: 'product#update'
end
