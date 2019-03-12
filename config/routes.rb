Columbusrb::Application.routes.draw do

  get 'admin' => 'admin#index'
  namespace :admin do
    resources :speakers
    resources :board_members
  end

  root to: "pages#now"

  get 'feedback' => redirect("https://www.surveymonkey.com/r/JB9JX8X")

end
