class AddTimesSeenTodayToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :times_seen_today, :integer
  end
end
