source 'http://ruby.taobao.org'
ruby '2.1.1'
gem 'rails', '~> 4.0.0'
group :assets do
  gem 'sass-rails',   '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
end
#gem 'jquery-rails'
gem 'jquery-rails', "< 3.0.0"
gem 'sass', '~> 3.2.0'
gem 'bootstrap-sass', '>= 3.0.0.0'
gem 'mongoid', '4.0.0.beta1'
gem 'simple_form'
gem 'kaminari'
gem 'nokogiri'
gem 'rufus-scheduler'
gem 'inherited_resources'
gem 'kaminari-bootstrap', github: 'mcasimir/kaminari-bootstrap'
gem 'mongoid_taggable_on'
gem 'meta-tags', :require => 'meta_tags'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'activeadmin-mongoid', github: 'fred/activeadmin-mongoid', branch: 'rails4-order-clause'
gem "crummy", "~> 1.8.0"
# sitemap
gem 'sitemap_generator'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx, :ruby]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'debugger', github: 'cldwalker/debugger'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
group :production do
  gem 'thin'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'email_spec'
  gem 'mongoid-rspec'
end
gem "figaro", ">= 0.6.3"
gem 'rails_kindeditor'
#gem "mongoid-enum", github: 'thetron/mongoid-enum'
gem "enumerize"
gem 'cells'
gem 'rspec-cells', :group => [:development, :test]

#omniauth
gem 'omniauth'
gem 'omniauth-oauth2', git: 'git://github.com/intridea/omniauth-oauth2.git'
gem 'omniauth-baidu-social','>= 0.0.1',
  git: 'git://github.com/destinyd/omniauth-baidu-social.git'

#plus
gem 'devise'

#rails4
#gem 'activeresource', '~> 4.0.0'
#gem 'protected_attributes', '~> 1.0.1'
#gem "bson"
#gem "moped", github: "mongoid/moped"
