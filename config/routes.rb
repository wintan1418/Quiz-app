Rails.application.routes.draw do
  devise_for :users
  
  resources :quizos do
    resources :quesitions
    resources :contestants, only: [:new, :create]
    resources :submissions, only: [:show, :create], as: 'submissions'
  end

  get 'quesitions/index', to: 'quesitions#index', as: 'quesitions_index'

  root "quizos#index"
end
