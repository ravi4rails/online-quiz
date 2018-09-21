Rails.application.routes.draw do
  root 'home#index'
  resources :test_papers do 
    member do 
      get :preview_test
    end
  end

  resources :multiple_choice_questions do 
  end

  get '/load_question' => 'multiple_choice_questions#load_question'
  get '/load_previous_question' => 'multiple_choice_questions#load_previous_question'

  get '/load_next_question' => 'multiple_choice_questions#load_next_question'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
