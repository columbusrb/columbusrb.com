# coding: utf-8
Columbusrb::Application.routes.draw do
  devise_for :admin_users, only: [:sessions, :omniauth_callbacks],
             controllers: {
               sessions: 'admin/sessions',
               omniauth_callbacks: 'admin/sessions'
             }

  get 'admin' => 'admin#index'

  namespace :admin do
    resources :speakers
    resources :board_members
  end

  root to: "pages#now"
  get '/2020/location', to: 'pages#location'

  get 'feedback' => redirect("https://www.surveymonkey.com/r/JB9JX8X")
end
