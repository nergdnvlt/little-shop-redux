class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table  :invoice_items do |t|
      t.integer   :item_id
      t.integer   :invoice_id
      t.integer   :quantity
      t.float     :unit_price
      t.timestamps null: false
    end
  end
end