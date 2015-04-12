source 'https://rubygems.org'
gem 'rails', '4.2.0'
gem 'pg'
gem 'rack-rewrite'

gem 'jquery-rails'
# gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sprockets-coffee-react'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :assets do
  gem 'sass-rails', '~> 5.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.1.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  gem 'rspec-rails', '>= 2.11.0'
  gem 'factory_girl_rails', '>= 4.0.0'
  gem 'pry'
end

group :development do
  gem 'powder'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'capybara',   '>= 2.2.1'
  gem 'selenium-webdriver', '>= 2.43.0'
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
end
