source 'https://rubygems.org'

ruby "2.1.4"

gem 'rails', '4.2.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bootstrap-sass', '~> 3.3.3'
gem 'sass-rails', '~> 5.0.1'
gem 'therubyracer', platforms: :ruby
gem 'autoprefixer-rails'

gem "activerecord-tableless", ">= 1.3.4",  git:'https://github.com/david135/activerecord-tableless.git' # helps to use Rails without a database

gem 'figaro' # configuration framework
gem 'gibbon' #access to the MailChimp API
gem 'google_drive' #use Google Drive spreadsheets for data storage
gem 'google-api-client'
gem 'high_voltage' #  for static pages like “about”
gem 'simple_form' # forms made easy
gem "font-awesome-rails"

group :development, :test do
  gem 'sqlite3', '1.3.10'
  gem 'byebug', '3.4.0'
  gem 'web-console', '2.0.0.beta3'
  gem 'spring', '1.1.3'
end

group :development do
  gem 'better_errors' # helps when things go wrong
  gem 'quiet_assets' # suppresses distracting messages in the log
  gem 'rails_layout' # generates files for an application layout
end

group :development, :production do
  gem 'pg', '0.18.1'
end

group :production do
  gem 'rails_12factor', '0.0.3'
  gem 'thin'
end