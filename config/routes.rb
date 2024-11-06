Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  
  root "home#index"
  get "members/:id", to: "members#show", as: "members"
  get "edit_user_profile", to: "members#edit_user_profile", as: "edit_user_profile"
  get "edit_user_about", to: "members#edit_user_about", as: "edit_user_about"
  get "profile", to: "members#profile", as: "profile"
  patch "update_profile", to: "members#update_profile", as: "update_profile"
  patch "update_about", to: "members#update_about", as: "update_about"
  resources :work_experiences
  resources :connections
end
