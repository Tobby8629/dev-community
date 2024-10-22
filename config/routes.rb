Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  
  root "home#index"

  get "members/:id", to: "members#show", as: "members"
end
