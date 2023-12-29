require 'faraday'
require 'json'

class MusixMatchService
  def self.conn
    Faraday.new(url: "https://api.musixmatch.com/ws/1.1/")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body)
  end

  def self.music_genres
    get_url("music.genres.get")
  end
end