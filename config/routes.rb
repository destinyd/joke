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

  diy_url = proc { | name |
    get name.to_s + '(-p:page)' => 'jokes#' + name, as: name.to_sym, defaults: {page: 1}
  }

  Joke.tags_english_names.each do |name|
    diy_url.call name
  end

  resources :jokes
  root :to => "home#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, controllers: {
    omniauth_callbacks: :authentications
  }
  ActiveAdmin.routes(self)
end
