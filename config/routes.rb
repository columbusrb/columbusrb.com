Columbusrb::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  post '/speakers/add', to: "pages#add_speaker"

  root to: "pages#landing"
end
