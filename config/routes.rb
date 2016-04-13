Rails.application.routes.draw do

  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      resources :merchants, controller: "merchants/merchants", as: "merchants", only: [:index, :show] do # 'controller:' changed from 'to:' after deprecation warning on specs
        member do
          get 'items'
          get 'invoices'
        end
        collection do
          get "find", to: "merchants/merchants_find/find#show"
          get "find_all", to: "merchants/merchants_find/find#index"
          get "random", to: "merchants/merchants_random/random#show"
        end
      end
      resources :items, controller: 'items/items', as: "items", only: [:index, :show] do
        member do
          get "invoice_items"
          get "merchant"
        end
        collection do
          get "find", to: "items/items_find/find#show"
          get "find_all", to: "items/items_find/find#index"
          get "random", to: "items/items_random/random#show"
        end
      end
      resources :customers, controller: "customers/customers", as: "customers", only: [:index, :show] do
        collection do
          get "find", to: "customers/customers_find/find#show"
          get "find_all", to: "customers/customers_find/find#index"
          get "random", to: "customers/customers_random/random#show"
        end
      end
      resources :invoices, controller: "invoices/invoices", as: "invoices", only: [:index, :show] do
        member do
          get "transactions"
          get "invoice_items"
          get "items"
          get "customer"
          get "merchant"
        end
        collection do
          get "find", to: "invoices/invoices_find/find#show"
          get "find_all", to: "invoices/invoices_find/find#index"
          get "random", to: "invoices/invoices_random/random#show"
        end
      end
      resources :invoice_items, controller: "invoice_items/invoice_items", as: "invoice_items", only: [:index, :show] do
        member do
          get "invoice"
          get "item"
        end
        collection do
          get "find", to: "invoice_items/invoice_items_find/find#show"
          get "find_all", to: "invoice_items/invoice_items_find/find#index"
          get "random", to: "invoice_items/invoice_items_random/random#show"
        end
      end
      resources :transactions, controller: "transactions/transactions", as: "transactions", only: [:index, :show] do
        member do
          get 'invoice'
        end
        collection do
          get "find", to: "transactions/transactions_find/find#show"
          get "find_all", to: "transactions/transactions_find/find#index"
          get "random", to: "transactions/transactions_random/random#show"
        end
      end
    end
  end
end
