Rails.application.routes.draw do
  resources :users
  scope '/api' do
    post 'auth/register'
    post 'auth/login'
    post 'auth/logout'
    post 'auth/refresh'
  end
end
