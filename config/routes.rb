Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  
  devise_for :users, controllers: {
    sessions:       'users/sessions', 
    registrations:  'users/registrations', 
    passwords:      'users/passwords', 
    confirmations:  'users/confirmations', 
    unlocks:        'users/unlocks'
  }
  
  resources :test_papers do 
    member do 
      get :preview_test
      post :start_test_paper
    end
  end

  namespace :admin do
    resources :test_papers 
    resources :submissions, only: [:index, :show]
  end

  resources :multiple_choice_questions do 
  end
  resources :user_response_values

  get '/load_question' => 'multiple_choice_questions#load_question'
  get '/load_previous_question' => 'multiple_choice_questions#load_previous_question'
  get '/load_next_question' => 'multiple_choice_questions#load_next_question'
  get '/question_marked_for_review' => 'user_response_values#question_marked_for_review'
  get '/test_submission' => 'test_papers#test_submission'
  get '/instruction' => "home#instruction"
end
