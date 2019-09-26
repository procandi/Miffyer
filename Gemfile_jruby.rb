source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyrhino'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# add bootstrap for pretty UI. @xieyinghua
gem 'bootstrap-sass'

# add global multiple language selector. @xieyinghua
gem 'rails-i18n'

# add font style. @xieyinghua
gem 'font-awesome-rails'

# handle cors problem. @xieyinghua
gem 'rack-cors', require: 'rack/cors'

# support for image upload. @xieyinghua
gem 'carrierwave', '~> 0.10.0'

# support for video upload. @xieyinghua
gem 'carrierwave-video'

# support new form code for view. @xieyinghua
gem 'simple_form'



# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# add write excel. @xieyinghua
gem 'writeexcel'

# web sevice soap server side. @xieyinghua
gem 'wash_out'

# add savon to call web service server. @xieyinghua
gem 'savon'

# add this to import or export database data. @xieyinghua
#gem 'seed_dump'


# a simple and clever server gem for test. @xieyinghua
gem 'puma'
# a simple and clever server gem for test, but hidden it now because display streaming too slow. @xieyinghua
#gem 'thin'
# a simple and clever server gem for test, but hidden it now because could not use in jruby. @xieyinghua
#gem 'unicorn'
# most popular server gem for test and production. @xieyinghua
#gem "passenger"

# jruby version rmagick, a popular imagick library. @xieyinghua
gem 'rmagick4j', require: 'RMagick'
# ruby version rmagick, a popular imagick library. @xieyinghua
#gem 'rmagick'


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem. @xieyinghua
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem. @xieyinghua
#gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :ruby]


# handle no execjs problem in ruby version. @xieyinghua
gem 'execjs'

# handle no execjs problem in ruby version. @xieyinghua
gem 'therubyracer'

# use for package jruby on rails to tomcat. @xieyinghua
gem 'warbler'

# add this to use rails console and support database. @xieyinghua
# if system use jruby-9.0.5.0, then activerecord-jdbc-adapter need equals 1.3.23. @xieyinghua
gem 'activerecord-jdbc-adapter', "1.3.23", :platform => :jruby




#group :development, :test do
  # Use jdbcsqlite3 as the database for Active Record
  # if system use jruby-9.0.5.0, then activerecord-jdbcsqlite3-adapter need equals 1.3.23. @xieyinghua
  #gem 'activerecord-jdbcsqlite3-adapter', "1.3.23", :platform => :jruby
  # Use sqlite3 as the database for Active Record. @xieyinghua
  #gem 'sqlite3'

  # use for jruby version debug. @xieyinghua
  #gem 'pry'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console, but hidden it now because use for ruby only. @xieyinghua
  #gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views, this gem can not install in jruby with windows. @xieyinghua
  #gem 'web-console', '~> 3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
#end

#group :production do
  # use for jruby version pg. @xiegyinghua
  # if system use jruby-9.0.5.0, then activerecord-jdbcpostgresql-adapter need equals 1.3.23. @xieyinghua
  gem 'activerecord-jdbcpostgresql-adapter', "1.3.23", :platform => :jruby
  # use pg as the database for Active Record, the version needed 0.20 for ruby 2.3.1. @xieyinghua
  #gem 'pg', '0.20'

  # user 12factor for pg. @xieyinghua
  gem 'rails_12factor'
#end

