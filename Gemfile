source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.8', '>= 7.0.8.6'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

gem 'bootsnap', require: false

gem 'rswag'
gem 'rswag-api', '~> 2.16'
gem 'rswag-ui'
gem 'rswag-specs', '~> 2.16'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'pry-rails'
  gem 'rspec-rails', '~> 6.0'
  gem 'factory_bot_rails'
end

group :test do
  gem 'shoulda-matchers', '~> 5.0'
  gem 'database_cleaner-active_record', '~> 2.0'
  gem 'database_cleaner-core', '~> 2.0'
end