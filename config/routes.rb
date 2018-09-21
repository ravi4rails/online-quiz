Rails.application.routes.draw do
  root 'home#index'
  resources :test_papers do 
    member do 
      get :preview_test
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
