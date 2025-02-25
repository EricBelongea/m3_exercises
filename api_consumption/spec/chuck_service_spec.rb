require './spec/spec_helper'


describe ChuckService do

  it 'can find a random Chuck Norris joke' do
    joke = ChuckService.random

    expect(joke).to have_key("icon_url")
    expect(joke).to have_key("id")
    expect(joke).to have_key("value")
  end

  it 'can find a random joke in a category' do
    joke = ChuckService.random_in_category('music')

    expect(joke).to have_key("categories")
    expect(joke).to have_key("icon_url")
    expect(joke).to have_key("id")
    expect(joke).to have_key("value")
  end

  it 'can find a list of all categories' do
    categories = ChuckService.categories

    expect(categories).to include("music")
    expect(categories).to include("science")
    expect(categories).to include("fashion")
    expect(categories).to include("money")
    expect(categories).to include("career")
  end

  it 'can search for a joke' do
    search_results = ChuckService.search("snakes")

    expect(search_results).to have_key("total")
    expect(search_results).to have_key("result")
    expect(search_results["result"][0]).to have_key("categories")
    expect(search_results["result"][0]).to have_key("icon_url")
    expect(search_results["result"][0]).to have_key("id")
    expect(search_results["result"][0]).to have_key("value")
  end
end
