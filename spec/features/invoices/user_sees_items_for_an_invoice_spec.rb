require './app/models/invoice.rb'
require './app/models/item.rb'

RSpec.describe "User sees a list of items" do
  before(:each) do
    @merchant1 = Merchant.create(id: 1, name: 'Tyler')
    @merchant2 = Merchant.create(id: 2, name: 'Nikhil')
    @invoice_1 = Invoice.create!(customer_id: 28, merchant_id: 1, status: 'pending')
    @item_1 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 555, merchant_id: 1)
    @item_2 = Item.create!(name: 'Cup', description: 'container', unit_price: 444, merchant_id: 1)
    @invoice_item_1 = @invoice_1.invoice_items.create!(item_id: 1, invoice_id: 1, quantity: 666, unit_price: 555)
    @invoice_item_2 = @invoice_1.invoice_items.create!(item_id: 2, invoice_id: 1, quantity: 108, unit_price: 444)

    @invoice_2 = Invoice.create!(customer_id: 50, merchant_id: 2, status: 'pending')
    @item_3 = Item.create!(name: 'mjolnir', description: 'hammer', unit_price: 20, merchant_id: 2)
    @item_4 = Item.create!(name: 'Cup', description: 'container', unit_price: 55, merchant_id: 2)
    @invoice_item_3 = @invoice_2.invoice_items.create!(item_id: 1, invoice_id: 2, quantity: 200, unit_price: 20)
    @invoice_item_4 = @invoice_2.invoice_items.create!(item_id: 2, invoice_id: 2, quantity: 66, unit_price: 55)
  end

  it 'it lists the items for each invoice' do

    visit "/invoices/#{@invoice_1.id}"

    expect(page).to have_content(@invoice_item_1.unit_price)
    expect(page).to have_content(@invoice_item_2.unit_price)
    expect(page).to have_content(@invoice_item_1.quantity)
    expect(page).to have_content(@invoice_item_2.quantity)
    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_2.name)
  end
 end
