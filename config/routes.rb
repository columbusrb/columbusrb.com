Columbusrb::Application.routes.draw do

  post '/speakers/add', to: "pages#add_speaker"

  root to: "pages#now"
end
