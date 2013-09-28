source 'https://rubygems.org'

ruby '2.0.0' #ruby '1.8.7' #

gem 'rails', '3.2.8'

gem 'pg'
gem 'high_voltage'
gem 'jquery-rails'
gem 'twitter-bootstrap-rails', '2.0.8'
gem 'best_in_place'
gem 'newrelic_rpm'

group :development do
  gem 'guard-spork'
end

group :test, :development do
  gem 'rspec-rails'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'spork-rails'
  gem 'capybara-webkit'
  gem 'launchy'
end

group :production do
  gem 'thin'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
