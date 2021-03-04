Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "stocks#index"

  resources :stocks
  post :upload_stock_tsv, to: 'stocks#upload'
  get :search, to: 'stocks#search'

end
