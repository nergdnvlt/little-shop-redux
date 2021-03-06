class Item < ActiveRecord::Base
belongs_to :merchant
has_many   :invoice_items
has_many :invoices, through: :invoice_items
validates_presence_of :name
validates_presence_of :description
validates_presence_of :unit_price

  def self.average_price
    (average(:unit_price).to_f / 100).round(2)
  end

  def self.total_items
    Item.all.count
  end

  def self.get_items_from_merchant
    Merchant.merchant_items(id)
  end

  def self.newest_item
    Item.order(created_at: :desc).first
  end

  def self.oldest_item
    Item.order(created_at: :asc).first
  end

  def self.total_price
    InvoiceItem.sum("quantity * unit_price")
  end
end
