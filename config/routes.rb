Rails.application.routes.draw do
  # jsonapi_resources :currencies
  # jsonapi_resources :customers
  jsonapi_resources :fx_transactions, only: %i[create show index], as: :fx_txn
end
