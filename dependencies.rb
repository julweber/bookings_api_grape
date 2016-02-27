ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'bundler'

%w(
grape
grape-swagger
sinatra
active_support/core_ext/string
).each do |dep|
  require dep
end

$env = ENV['RACK_ENV']
