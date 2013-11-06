Ddjoke::Application.routes.draw do
  get 'jokes(-p:page)' => 'jokes#index', as: :jokes, defaults: {page: 1}
  get 'short(-p:page)' => 'jokes#short', as: :short, defaults: {page: 1}
  get 'long(-p:page)' => 'jokes#long', as: :long, defaults: {page: 1}
  get 'image(-p:page)' => 'jokes#image', as: :image, defaults: {page: 1}
  resources :jokes
  root :to => "home#index"
end
