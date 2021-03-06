require './app/models/merchant.rb'

RSpec.describe Merchant do
  describe 'Instance Methods' do
    it 'Calculates total price of all items per merchant' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(merchant2.total_sales).to eq(999.0)
    end

    it 'Calculates total number of items per merchant' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 2)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)

      expect(merchant2.total_items).to eq(2)
    end

    it 'Calculates average price of items per merchant' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 2)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      expect(merchant2.average_price).to eq(499.50)
    end
  end

  describe 'Class Methods' do
    it 'Finds the max_price for all items' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.max_price).to eq(999)
      expect(Merchant.max_price).to_not eq(666)
      expect(Merchant.max_price).to_not eq(444)
    end

    it 'Finds the item from max_price' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.find_item_for_max_price).to be_an_instance_of(Item)
      expect(Merchant.find_item_for_max_price.name).to eq('mjolnir')
      expect(Merchant.find_item_for_max_price).to_not be_an_instance_of(Merchant)
    end

    it 'Finds the merchant id from the item' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.find_merchant_id_from_price).to eq(2)
      expect(Merchant.find_merchant_id_from_price).to_not eq(1)
    end

    it 'Finds the merchant name from the id' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.merchant_with_highest_price_item.name).to eq('Nikhil')
      expect(Merchant.merchant_with_highest_price_item.name).to_not eq('Tyler')
    end

    it 'Builds an array of merchant names and item counts' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.merchants_with_quantity).to be_an_instance_of(Array)
      expect(Merchant.merchants_with_quantity.first).to be_an_instance_of(Hash)
    end

    it 'Gets the merchant name and item count for top merchant ' do
      merchant1 = Merchant.create!(name: 'Tyler')
      item_3 =Item.create!(name: 'bob', description: 'nail', unit_price: 1, merchant_id: 1)
      merchant2 = Merchant.create!(name: 'Nikhil')
      item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 999, merchant_id: 2)
      invoice_item_1 = InvoiceItem.create!(item_id: 2, invoice_id: 1, quantity: 666, unit_price: 555)
      item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 2)
      invoice_item_2 = InvoiceItem.create!(item_id: 3, invoice_id: 1, quantity: 108, unit_price: 444)

      expect(Merchant.merchant_with_highest_quantity).to be_an_instance_of(Hash)
      expect(Merchant.merchant_with_highest_quantity["name"]).to eq('Nikhil')
      expect(Merchant.merchant_with_highest_quantity["count"]).to eq(2)
    end
  end

  describe 'Validate fields' do
    it 'Is invalid to not have a name' do
      merchant = Merchant.new()
      expect(merchant).to_not be_valid
    end
  end
end
