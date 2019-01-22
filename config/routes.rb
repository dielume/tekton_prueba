Rails.application.routes.draw do
  root to: "home#index"
  resources :purchase_orders
  # resources :messages, only: [:create]
  resources :chat_rooms, only: [:index, :show] do
    resources :messages, only: [:create]
  end
  devise_for :users

  namespace :api, :defaults => {:format => :json} do
    as :user do
      post   "/sign-in"       => "sessions#create"
      delete "/sign-out"      => "sessions#destroy"
      resources :purchase_orders, only: [:index, :show, :create] do
        member do
          get "status"
        end
      end
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
