require 'sinatra'
require 'grape'

# require models
Dir['./models/*.rb'].each{ |f| require f }

# require apis
Dir['./api/*.rb'].each{ |f| require f }

API_USERNAME = ENV['API_USERNAME'] ? ENV['API_USERNAME'] : 'admin'
API_PASSWORD= ENV['API_PASSWORD'] ? ENV['API_PASSWORD'] : 'admin'

class Web < Sinatra::Base
  get '/' do
    'Hello world.'
  end
end

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == API_USERNAME and password == API_PASSWORD
end

use Rack::Session::Cookie
run Rack::Cascade.new [API, Web]
