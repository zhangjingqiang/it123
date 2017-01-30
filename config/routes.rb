Rails.application.routes.draw do
  resources :big_categories do
    resources :small_categories do
      resources :sites
    end
  end

  devise_for :admins
  get 'admin', :to => 'admin#index'
  get 'admins', :to => 'admin#index'
  namespace :admin do
    resources :big_categories
    resources :small_categories
    resources :sites
    get 'load_small_categories', to: 'sites#load_small_categories'
    get 'search_small_categories', to: 'small_categories#search', as: 'search_small_categories'
    get 'search_sites', to: 'sites#search', as: 'search_sites'
  end

  root 'welcome#index'

  get ':big_category_id', to: 'big_categories#show', as: 'big'
  get ':big_category_id/:small_category_id', to: 'small_categories#show', as: 'small'
end
