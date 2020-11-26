Rails.application.routes.draw do
  devise_for :breweries
  resources :breweries do
    resources :brews
  end
  root to: 'welcome#index'

  get 'pricing', to: 'pricing#index'
  get 'pricing/basic', to: 'pricing#basic'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
