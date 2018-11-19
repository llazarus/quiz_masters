Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "welcome#index"
  get('/leaderboard', { to: 'welcome#leaderboard'})

  resources :quizzes do
    post :submit, on: :member
    resources :questions do
      resources :answers, shallow: true
    end
    resources :takes, only: [ :create, :update, :destroy ]
  end


end
