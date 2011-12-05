source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end

gem 'sqlite3'

# Used for forcing Heroku dyno to stay up.
gem 'rufus-scheduler'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'haml-rails'
gem 'devise'

# Settingslogic for Facebook auth
#gem "settingslogic"

# Koala for fb auth
gem 'koala'

# Gravatar
gem 'gravatar_image_tag'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Heroku
gem 'heroku'

# To use debugger
# gem 'ruby-debug19'

group :development, :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'minitest'

  gem 'rspec-rails'
  gem 'autotest'
  gem 'autotest-rails'

  gem 'ZenTest'
  gem 'webrat'

  #gem 'cucumber-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl'
  #gem 'cucumber-websteps'
end

