require 'spec_helper'

describe API do
  def app
    API
  end

  describe "GET /api/v1/bookings" do
    it "returns an array of bookings" do
      get "/api/v1/bookings"
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).not_to be_empty
    end
  end

  describe "POST /api/v1/bookings" do
    it "returns an array of bookings" do
      post "/api/v1/bookings", {:artist => "2ZG", organizer: "Splash"}
      expect(last_response.status).to eq(201)
      expect(last_response.body).to include "2ZG"
      expect(last_response.body).to include "Splash"
    end
  end
end
