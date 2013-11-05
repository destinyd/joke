Ddjoke::Application.routes.draw do
  resources :jokes do
    get :short, on: :collection
    get :long, on: :collection
    get :image, on: :collection
  end
  root :to => "home#index"
end
