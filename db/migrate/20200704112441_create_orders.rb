class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :city
      t.string :product_id
      t.float :order_id
      t.string :first_name
      t.string :last_name
      t.integer :unit_sold
      t.decimal :unit_price
      t.float   :latitude
      t.float   :longitude

      t.timestamps
    end
  end
end
