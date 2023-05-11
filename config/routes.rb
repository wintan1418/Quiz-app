Rails.application.routes.draw do
  get 'submissions/create'
  get 'submissions/show'
  
  
  devise_for :users
  
 
  resources :quizos do
    resources :quesitions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   resources :submissions, only: [:show, :create], as: 'submissions'
  # Defines the root path route ("/")
  end
   root "quizos#index"
end
