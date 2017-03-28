Rails.application.routes.draw do
  devise_for :user

  root to: 'students#index'


  resources :reports do
    get :subjects, on: :collection
  end
  resources :students, :teachers do
    get :subjects
  end
end
