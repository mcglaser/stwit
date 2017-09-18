class Stock < ActiveRecord::Base


def time_since(stock_last_seen) 
  (Time.parse(DateTime.now.to_s) - Time.parse(stock_last_seen.to_s))/3600
end


end