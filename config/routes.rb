Columbusrb::Application.routes.draw do

  namespace :admin do
    root to: 'admin#index'
    resources :speakers
  end

  root to: "pages#now"

  get 'feedback' => redirect("https://www.surveymonkey.com/r/JB9JX8X")

end
