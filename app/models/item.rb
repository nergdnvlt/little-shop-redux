class Item < ActiveRecord::Base
validates_presence_of :name
validates_presence_of :description
validates_presence_of :unit_price


end
