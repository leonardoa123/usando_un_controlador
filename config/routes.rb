Rails.application.routes.draw do
  resources :cars do
    member do
      get :full_model
      get :available_trunk_space
      get :kilometers_before_wheel_change
      patch :store_in_trunk
      get :wheel_usage_status
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
