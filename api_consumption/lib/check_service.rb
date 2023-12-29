require 'faraday'
require 'json'


class ChuckService
  def self.conn
    Faraday.new(url: "https://api.chucknorris.io")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body)
  end

  def self.random
    get_url("/jokes/random")
  end

  def self.random_in_category(category)
    get_url("/jokes/random?=category#{category}")
  end

  def self.categories
    get_url("/jokes/categories")
  end

  def self.search(search)
    get_url("/jokes/search?query=#{search}")
  end
end