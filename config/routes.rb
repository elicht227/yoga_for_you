Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "categories#index"
  resources :attendees
  resources :students
  resources :teachers
  resources :events
  resources :reviews
  resources :parks
  resources :categories
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
