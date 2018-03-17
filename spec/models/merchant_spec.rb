require './app/models/merchant.rb'

RSpec.describe Merchant do
  describe 'Class Methods' do
    it 'Calculates total number of items per merchant' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 2)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      expect(Merchant.total_items(2)).to eq(2)
    end

    it 'Calculates average price of items per merchant' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 2)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      expect(Merchant.average_price(2)).to eq(499.50)
    end

    it 'Calculates total price of all items per merchant' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)
      expect(Merchant.total_price(2)).to eq(417582.00)
    end
  end

  describe 'Validate fields' do
    it 'Is invalid to not have a name' do
      merchant = Merchant.new()
      expect(merchant).to_not be_valid
    end
  end
end
