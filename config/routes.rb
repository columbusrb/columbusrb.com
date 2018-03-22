Columbusrb::Application.routes.draw do

  resources :speakers

  root to: "pages#now"

  get 'feedback' => redirect("https://www.surveymonkey.com/r/JB9JX8X")

end
