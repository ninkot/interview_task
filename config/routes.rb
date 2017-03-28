Rails.application.routes.draw do
  devise_for :user
  
  root to: 'students#index'

  resources :teachers
  resources :report_subjects
  resources :students do
    get :subjects
  end
end
