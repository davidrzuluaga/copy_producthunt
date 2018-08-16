Rails.application.routes.draw do
  get 'product/index'
  get 'products', to: 'product#index'
end
