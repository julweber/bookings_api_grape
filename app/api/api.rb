class API < Grape::API
  API_VERSION = 'v1'

  prefix 'api'
  version API_VERSION, using: :path
#  format :json

  get :hello do
    { hello: 'world' }
  end

  get :info do
    {
      name: 'Bookings API',
      description: 'An api allowing booking management',
      version: API_VERSION
    }
  end

  resource :bookings do

    # Custom endpoints
    desc 'Return booking statistics.'
    get :stats do
        {
          total_bookings: Booking.all.count
        }
    end

    # Index
    desc 'Return the list of bookings.'
    get do
      Booking.all
    end

    # Read
    desc 'Return a booking.'
    params do
      requires :id, type: Integer, desc: 'Booking id.'
    end
    route_param :id do
      get do
        Booking.find(params[:id])
      end
    end

    # Create
    desc 'Create a booking.'
    params do
      requires :organizer, type: String, desc: 'Organizer name.'
      requires :artist, type: String, desc: 'Artist name.'
    end
    post do
      Booking.create({
        artist: params[:artist],
        organizer: params[:organizer],
      })
    end

    # Update
    desc 'Update a booking.'
    params do
      requires :id, type: Integer, desc: 'Booking id.'
      requires :stage_time, type: String, desc: 'Bookign stage time.'
    end
    put ':id' do
      b = Booking.find(params[:id])
      b.stage_time = params[:stage_time] unless b.nil?
      b
    end

    desc 'Delete a Booking.'
    params do
      requires :id, type: Integer, desc: 'Booking id.'
    end
    delete ':id' do
      b = Booking.find(params[:id])
      b.delete unless b.nil?
      b
    end

  end

  add_swagger_documentation api_version: 'v1'
end
