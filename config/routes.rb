Rails.application.routes.draw do
  resources :purchase_orders
  # resources :messages, only: [:create]
  resources :chat_rooms, only: [:index, :show] do
    resources :messages
  end
  devise_for :users
  root to: "home#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
