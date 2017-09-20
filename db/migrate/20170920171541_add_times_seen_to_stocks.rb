class AddTimesSeenToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :times_seen, :integer
  end
end
