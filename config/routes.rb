Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get "up" => "rails/health#show", as: :rails_health_check
  root 'welcome#index'
end
