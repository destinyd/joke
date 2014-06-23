source 'http://ruby.taobao.org'
#ruby '2.1.1'
gem 'rails', '~> 3.2.17'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
#gem 'jquery-rails'
gem 'jquery-rails', "< 3.0.0"
gem 'sass', ['>= 3.1', '< 3.3']
gem 'bootstrap-sass', '>= 3.0.0.0'
gem 'mongoid'
gem 'simple_form'
gem 'kaminari'
gem 'nokogiri'
gem 'rufus-scheduler'
gem 'inherited_resources'
gem 'kaminari-bootstrap', github: 'mcasimir/kaminari-bootstrap'
gem 'mongoid_taggable_on'
gem 'meta-tags', :require => 'meta_tags'
gem 'activeadmin-mongoid'
gem "crummy", "~> 1.7.1"
# sitemap
gem 'sitemap_generator', github: 'destinyd/sitemap_generator'
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
  #gem 'debugger', github: 'cldwalker/debugger'
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
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'mongoid-rspec'
end
gem "figaro", ">= 0.6.3"
gem 'rails_kindeditor'
gem "mongoid-enum"
gem 'cells'
gem 'rspec-cells', :group => [:development, :test]

#omniauth
gem 'omniauth'
gem 'omniauth-oauth2', git: 'git://github.com/intridea/omniauth-oauth2.git'
gem 'omniauth-baidu-social','>= 0.0.1',
  git: 'git://github.com/destinyd/omniauth-baidu-social.git'
