Ddjoke::Application.routes.draw do
  get 'sitemap_pages(_:page)' => 'sitemap_pages#index', as: :sitemap_pages, defaults: {page: 1}
  resources :joke_offers do 
    get :list, on: :collection
    member do 
      get :approved
      get :declined
    end
  end
  post 'yixin' => 'mp#yixin'
  get 'download' => "home#download", as: :download
  get 'jokes(-p:page)' => 'jokes#index', as: :jokes, defaults: {page: 1}
  get 'short(-p:page)' => 'jokes#short', as: :short, defaults: {page: 1}
  get 'long(-p:page)' => 'jokes#long', as: :long, defaults: {page: 1}
  get 'image(-p:page)' => 'jokes#image', as: :image, defaults: {page: 1}
  get 'video(-p:page)' => 'jokes#video', as: :video, defaults: {page: 1}
  resources :jokes
  root :to => "home#index"
  #devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {
    omniauth_callbacks: :authentications
  }
  #ActiveAdmin.routes(self)
end
