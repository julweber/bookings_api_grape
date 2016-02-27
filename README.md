# bookings_api_grape

This is a very basic grape based api application using sinatra as a host.
Consider this as a first approach to using grape.

## Usage
```
git clone https://github.com/julweber/bookings_api_grape.git
cd bookings_api_grape

bundle install
export API_USERNAME=admin
export API_PASSWORD=admin
rackup
```

## Execute Testsuite
```
bundle exec rspec
```


## API Query Examples

```
export API_USERNAME=admin
export API_PASSWORD=admin

# Get requests
curl -u $API_USERNAME:$API_PASSWORD http://localhost:9292/api/v1/info
curl -u $API_USERNAME:$API_PASSWORD http://localhost:9292/api/v1/hello
curl -u $API_USERNAME:$API_PASSWORD http://localhost:9292/api/v1/bookings
curl -u $API_USERNAME:$API_PASSWORD http://localhost:9292/api/v1/bookings/stats
curl -u $API_USERNAME:$API_PASSWORD http://localhost:9292/api/v1/bookings/:id

# Post requests
curl -u $API_USERNAME:$API_PASSWORD -H "Content-Type: application/json" -X POST -d '{"artist":"2ZG","organizer":"Splash"}' http://localhost:9292/api/v1/bookings

# Update requests
curl -u $API_USERNAME:$API_PASSWORD -H "Content-Type: application/json" -X PUT -d '{"stage_time":"01:00"}' http://localhost:9292/api/v1/bookings/:id

# Delete requests
curl -u $API_USERNAME:$API_PASSWORD -H "Content-Type: application/json" -X DELETE http://localhost:9292/api/v1/bookings/:id

# Get swagger documentation
curl -u $API_USERNAME:$API_PASSWORD http://localhost:9292/api/v1/swagger_doc
```
