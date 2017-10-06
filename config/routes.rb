Columbusrb::Application.routes.draw do

  post '/speakers/add', to: "pages#add_speaker"

  root to: "pages#now"

  get 'feedback' => redirect("https://www.surveymonkey.com/r/JB9JX8X")

  get '/companies', to: "pages#companies"
end
