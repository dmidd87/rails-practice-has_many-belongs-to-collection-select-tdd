Rails.application.routes.draw do
  root to: "pages#index"
  resources :cats
  resources :toys
end
