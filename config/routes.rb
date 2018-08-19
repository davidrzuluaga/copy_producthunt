Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'product#index'
  get 'products', to: 'product#index'
  get 'products/new', to: 'product#new', as: 'new_product'
  post '/products', to: 'product#create'
  get 'products/:id', to: 'product#show', as: 'product'
  get '/products/:id/edit', to: 'product#edit'
  get '/products/:id/edit', to: 'products#edit', as: 'edit_product'
  delete '/products/:id', to: 'product#destroy'
  patch '/products/:id', to: 'product#update'  
end
