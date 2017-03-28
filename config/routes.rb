Rails.application.routes.draw do
  root to: 'students#index'
  
  resources :students do
    get :subjects
  end
end
