Rails.application.routes.draw do
  devise_for :user

  root to: 'visitors#index'

  get 'reports/index', to: 'reports#subjects', as: 'report_subjects'
  resources :students, :teachers do
    get :subjects
  end
end
