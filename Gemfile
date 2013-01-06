source 'https://rubygems.org'

gem 'rails', '3.2.1'
gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'therubyracer'#, :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'haml'
gem 'pjax_rails'
gem 'jquery-rails'
gem 'twitter-bootstrap-rails'
gem 'less-rails'
gem 'less-rails-bootstrap'
gem 'surveyor', :git => 'git://github.com/NUBIC/surveyor.git'
gem 'acts_as_list', :git => 'git://github.com/swanandp/acts_as_list.git'

group :development do
  gem 'rb-readline'
end

group :development, :test do
  gem 'annotate'
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