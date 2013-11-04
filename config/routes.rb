Ddjoke::Application.routes.draw do
  resources :jokes
  root :to => "home#index"
end
