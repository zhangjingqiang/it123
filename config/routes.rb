Rails.application.routes.draw do
  resources :big_categories do
    resources :small_categories do
      resources :sites
    end
  end
  
  get 'big_category/:id', to: 'big_categories#show', as: 'big'
  get 'big_category/:big_category_id/small_category/:small_category_id', to: 'sites#index', as: 'site'
  
  devise_for :admins
  get 'admin', :to => 'admin#index'
  get 'admins', :to => 'admin#index'
  namespace :admin do
    resources :big_categories
    resources :small_categories
    resources :sites
    get 'load_small_categories', to: 'sites#load_small_categories'
  end
  
  root 'welcome#index'
end
