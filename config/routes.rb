Rails.application.routes.draw do
  devise_for :user

  root to: 'visitors#index'

  get 'reports/index', to: 'reports#subjects', as: 'report_subjects'
  resources :payments, only: :index
  resources :students, :teachers do
    get :payment
    get :subjects
  end
end
