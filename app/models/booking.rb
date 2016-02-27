require 'securerandom'
require 'json'

class Booking
  attr_accessor :id, :organizer, :date, :location, :stage_time, :soundcheck_time, :artist, :metadata
  @@bookings = nil

  def self.find(id)
    self.bookings.select { |b| b.id == id}.first
  end

  def self.all
    self.bookings
  end

  def delete
    self.class.bookings.reject! { |b| b.id == id }
  end

  def self.create(hash)
    booking = Booking.new
    booking.id = (rand(400)-200).abs
    booking.organizer = hash[:organizer]
    booking.artist = hash[:artist]
    @@bookings << booking
    booking
  end

  def to_h
    {
        id: id,
        organizer: organizer,
        date: date,
        location: location,
        stage_time: stage_time,
        soundcheck_time: soundcheck_time,
        artist: artist,
        metadata: metadata
    }
  end

  def to_json(hash = {})
    to_h.to_json.to_s
  end

  private

  def self.bookings
    if @@bookings.nil?
      @@bookings = Array.new
      rand(100).times do
        @@bookings << self.generate_mock
      end
    end
    @@bookings
  end

  def self.generate_mock
    b = Booking.new
    b.id = rand(200)
    b.organizer = "Organizer_#{SecureRandom.hex}"
    b.date = Date.today+(10000*rand())
    b.location = "Location_#{SecureRandom.hex}"
    b.stage_time = '22:00'
    b.soundcheck_time = '18:00'
    b.artist = "Artist_#{SecureRandom.hex}"
    b.metadata = {}
    b
  end
end
