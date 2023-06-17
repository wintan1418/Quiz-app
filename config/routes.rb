# Rails.application.routes.draw do
#   devise_for :users

#   resources :quizos do
#     resources :quesitions, except: [:edit] do
#       member do
#         get 'view', to: 'quesitions#show'
#         get 'edit', to: 'quesitions#edit', as: 'edit_quizo_quesition'
#       end
#     end

#     resources :contestants, only: [:new, :create] do
#       resources :submissions, only: [:show]
#     end
#   end

#   resources :submissions, only: [:new, :create]

#   get 'quesitions/index', to: 'quesitions#index', as: 'quesitions_index'
#   get '/contestants/leaderboard', to: 'contestants#leaderboard'
#   root "quizos#index"
#   get 'new_submission', to: 'submissions#new', as: 'custom_new_submission'
# end

Rails.application.routes.draw do
  devise_for :users

  resources :quizos do
    resources :contestants, only: [:new, :create] do
      resources :quesitions, only: [:index,:show] # Nested within contestants, only need index action
      resources :submissions, only: [:show]
      post 'pick_quesition', on: :member # Add the pick_quesition action to contestants
    end

    resources :quesitions, except: [:edit] do
      member do
        get 'view', to: 'quesitions#show'
        get 'edit', to: 'quesitions#edit', as: 'edit_quizo_quesition'
      end
    end
  end

  resources :submissions, only: [:new, :create,:show]
  get 'quesitions/index', to: 'quesitions#index', as: 'quesitions_index'
  get '/contestants/leaderboard', to: 'contestants#leaderboard'
  root "quizos#index"
  get 'new_submission', to: 'submissions#new', as: 'custom_new_submission'
  get 'quizos/:id/leaderboard', to: 'quizos#leaderboard', as: 'quizo_leaderboard'

end

