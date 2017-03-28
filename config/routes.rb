Rails.application.routes.draw do
  devise_for :user

  root to: 'students#index'

  resources :teachers
  resources :reports do
    get :subjects, on: :collection
  end
  resources :students do
    get :subjects
  end
end
