Rails.application.routes.draw do

  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        collection do
          get "find", to: "merchants_find/find#show"
          get "find_all", to: "merchants_find/find#index"
          get "random", to: "merchants_random/random#show"
        end
      end
      resources :items, only: [:index, :show] do
        collection do
          get "find", to: "items_find/find#show"
          get "find_all", to: "items_find/find#index"
          get "random", to: "items_random/random#show"
        end
      end
    end
  end
end
