class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
            
      t.integer :twit_id
      t.string :symbol
      t.string :name
      t.datetime :last_seen
      
    end
  end
end
