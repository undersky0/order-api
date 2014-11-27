Rails.application.routes.draw do
  #, :path => "", :constraints => {:subdomain => "api"}
#namespace :api do
  namespace :v1, defaults: {format: 'json'} do
    resources :user
    resources :item_lines, except: [:new, :edit]
    resources :status_transitions, except: [:new, :edit]
    resources :orders, except: [:new, :edit]
    resources :products, except: [:new, :edit]
  end
#end
end
