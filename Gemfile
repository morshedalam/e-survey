source 'https://rubygems.org'

ruby 'ruby-1.9.3-p194'

gem 'rails', '3.2.6'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
end

gem 'jquery-rails'
gem 'bootstrap-sass', '>= 2.3.0.0'
gem 'surveyor'
gem 'acts_as_list'
gem 'haml-rails'
gem 'bcrypt-ruby'

gem 'faker', '1.0.1'
gem 'quiet_assets'

group :development do
  gem 'rb-readline'
  gem 'rename'
end

group :development, :test do
  gem 'mysql2'
  gem 'annotate', '>=2.5.0'
end

# Gems for production
group :production do
  gem 'pg'
end

group :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'webrat'
  gem 'factory_girl_rails', '1.0.1'
  gem 'spork', '0.9.0.rc3'

  gem 'cucumber'
  gem 'cucumber-rails', :require => false
  gem 'pickle', '~> 0.4.4'
end