# encoding: UTF-8

Hupengxing::Application.routes.draw do

  # mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  mount Ckeditor::Engine => '/ckeditor'

  root :to => "root#index"

  devise_for :users

  resources :categories, :only => ['show']
  resources :books, :only => ['show']

  resources :blogs do
    collection do
      post :comment
    end
  end


  # devise_for :admins

 namespace :admin do
   resources :categories
   resources :blogs
   resources :comments
   resources :books
 end


end
