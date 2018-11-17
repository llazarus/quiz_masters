Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "welcome#index"
  resources :quizzes, only: [:new, :create]
end
