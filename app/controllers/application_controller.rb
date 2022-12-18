class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'


  # add routes


  # GET /bakeries
  #   sets the Content-Type header in the response to application/json (FAILED - 1)
  #   returns an array of JSON objects for all bakeries in the database (FAILED - 2)

  get '/bakeries' do
    bakeries = Bakery.all 
      bakeries.to_json
  end

  # GET /bakeries/:id
  # sets the Content-Type header in the response to application/json (FAILED - 3)
  # returns a single bakery as JSON with its baked goods nested (FAILED - 4)

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id]) 
    bakery.to_json(include: :baked_goods)
  end

  # GET /baked_goods/by_price: 
  # returns an array of baked goods as JSON, sorted by price in descending order. 
  # (HINT: how can you use Active Record to sort the baked goods in a particular order?)

  get '/baked_goods/by_price' do

    baked_goods = BakedGood.all.order(:price).reverse_order
    baked_goods.to_json
  end


  # GET /baked_goods/most_expensive: 
  # returns the single most expensive baked good as JSON. 
  # (HINT: how can you use Active Record to sort the baked goods in a particular order?)

  get '/baked_goods/most_expensive' do

    baked_goods = BakedGood.all.order(:price).reverse_order.first
    baked_goods.to_json
  end

end
