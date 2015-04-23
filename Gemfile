source 'https://rubygems.org'

gem 'rails', '4.2.0'
# gem 'pg'
gem 'mongoid'
gem 'slim-rails'
gem 'cells'
gem 'devise'
gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mini_magick'

###### localisation ######
gem 'rails-i18n'
gem 'devise-i18n'

###### ui ######
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.4.1'
gem 'bootstrap-wysihtml5-rails'
gem 'font-awesome-rails', '~> 4.3.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'js-routes'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'angular-rails-templates'
gem 'ngannotate-rails'
source 'http://rails-assets.org' do
  gem 'rails-assets-angular'
  gem 'rails-assets-angular-animate'
  gem 'rails-assets-angular-file-upload'
  gem 'rails-assets-angular-ui-router'
  gem 'rails-assets-angular-ui-utils'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'quiet_assets'
  # gem 'byebug'
  # gem 'web-console', '~> 2.0'
  # gem 'spring'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'faker'
  # gem 'fabrication'
  # gem 'mailcatcher'
  # gem 'guard-rspec', require: false
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
  gem 'capistrano3-puma'
  gem 'sshkit'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
end
