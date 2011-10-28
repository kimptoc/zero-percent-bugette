#source 'http://rubygems.org'
source "http://rubygems.dev/"

gem 'rails'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'


if defined?(JRUBY_VERSION)
#  gem 'activerecord-jdbc-adapter'
#  gem 'jdbc-sqlite3', :require => false
  #jruby gems
  #gem 'activerecord-jdbc-adapter'
  gem 'activerecord-jdbc-adapter', :git => 'https://github.com/nicksieger/activerecord-jdbc-adapter.git'
  #gem 'activerecord-jdbcmysql-adapter'
  gem 'activerecord-jdbcsqlite3-adapter'
  gem "jruby-openssl"
else
#  gem 'sqlite3-ruby', :require => 'sqlite3'
  #non jruby gems
  gem 'sqlite3'
  #gem 'mysql'
end



# Asset template engines
gem 'sass-rails', '~> 3.1.4'
gem 'coffee-rails', '~> 3.1.1'
gem 'uglifier', '>= 1.0.3'

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'mocha'
end

gem 'simplecov', :require => false, :group => :test

gem 'devise'
gem 'devise_rpx_connectable'

#gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git', :branch => "rails-3.1"
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
#gem 'rails_admin', :git => 'git://github.com/kimptoc/rails_admin.git'
#gem 'rails_admin', :path => '../../libs/rails_admin'

group :development do
  gem 'rack-webconsole'
end

group :development do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'test-unit'
  gem 'pry'
  gem 'pry-doc'
  #gem 'ruby-debug-ide'
  #gem 'ruby-debug-base'
end

gem 'enumerated_attribute'

gem 'net-ssh'
gem 'net-scp'

gem 'net-sftp'

gem 'nestegg'

