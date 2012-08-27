Columbusrb::Application.routes.draw do
  match "evolution" => "pages#evolution", :as => :evolution
  root :to => "pages#landing"
end
