require 'httparty'

class StocksController < ApplicationController


  def create

    @api = HTTParty.get("https://api.stocktwits.com/api/2/trending/symbols.json")
    @symbols = @api.fetch("symbols")

  
  	@symbols.each do |symbol|

	    @stock = Stock.where(:twit_id => symbol.fetch("id")).first_or_initialize
	    @stock.symbol = symbol.fetch("symbol")
	    @stock.name = symbol.fetch("title")
	    if @stock.times_seen == nil 
	       @stock.times_seen = 1
	     else
	      @stock.times_seen += 1
	    end
	    
	    if @stock.last_seen == nil
	      @stock.last_seen = DateTime.now
	    elsif
	      (Time.parse(DateTime.now.to_s) - Time.parse(@stock.last_seen.to_s))/3600 >= 24
	      @stock.last_seen = DateTime.now
	    else
	      break
	    end
	      
	      
	    
	    if @stock.times_seen_today == nil 
	       @stock.times_seen_today = 1
	    elsif
	       @stock.last_seen == nil
	       @stock.times_seen_today = 1
	    elsif 
	      @stock.last_seen >= 24
	      @stock.times_seen_today = 0
	    else
	       @stock.times_seen_today += 1 
	    end 
	 
	    


	    @stock.save

    end  


    redirect_to stocks_path

  end


  def index
    @stocks = Stock.all
  end






def trending


  @api = HTTParty.get("https://api.stocktwits.com/api/2/trending/symbols.json")
 # @json = JSON.parse(response.body)

  @symbols = @api.fetch("symbols")


  @test = []
  @symbols.each do |symbol|
    @test << symbol.fetch("id")
  end


end







end