file_order = "lib/assets/order.csv"
file_products = "lib/assets/products.csv"


#order import
  orders_import = Proc.new{
  count_row = 0  
  CSV.foreach(file_order,
              headers: true,
              skip_blanks: true,
              skip_lines: /^(?:,\s*)+$/) do |row|
                count_row += 1
                puts "Imported row #{count_row}"
                #import data from csv file
                Order.create!(
                  city:              row[0],
                  product_id:        row[1].to_s,
                  order_id:          row[2].to_f,
                  first_name:        row[3],
                  last_name:         row[4],
                  unit_sold:         row[5],
                  unit_price:        row[6].to_f,
                  latitude:          row[11].to_f,
                  longitude:         row[12].to_f,
              )
             end
  puts "============ENDS============="
}

#Products import
 products_import = Proc.new{
  count_row = 0  
  CSV.foreach(file_products,
              headers: true,
              skip_blanks: true,
              skip_lines: /^(?:,\s*)+$/) do |row|
                count_row += 1
                puts "Imported row #{count_row}"
                #import data from csv file
                Product.create!(
                  title:               row[0].to_s,
                  description:         row[1],
                  price:               row[4],
                )
               end
  puts "============ENDS============="
}

#data import from here
require 'csv'
require 'date'
namespace :bears do
  desc "Import data from order.csv"
  desc "Import data from products.csv"
  task importdata: :environment do

    Product.destroy_all
    Order.destroy_all

    orders_import.call
    products_import.call

  end
end

