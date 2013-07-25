class Stock < ActiveRecord::Base
  attr_accessible :quantity, :starting_price, :symbol, :user_id

  belongs_to :user
end
