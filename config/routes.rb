Columbusrb::Application.routes.draw do

  namespace :api do
    post '/speakers/add', to: "pages#add_speaker"
  end

  root to: "pages#announcement"
end
