require 'csv'

# desc "Import Merchants from csv files"
# task :import => [:environment] do
#
#   file = "db/rails_engine_csv/data/merchants.csv"
#
#   CSV.foreach(file, :headers => true) do |row|
#     Merchant.create ({
#       name: row[1],
#       created_at: row[2],
#       updated_at: row[3]
#       })
#     end
#   end

# desc "Import Items from csv files"
# task :import => [:environment] do
#
#   file = "db/rails_engine_csv/data/items.csv"
#
#   CSV.foreach(file, :headers => true) do |row|
#     Item.create ({
#       name: row[1],
#       description: row[2],
#       unit_price: row[3],
#       merchant_id: row[4],
#       created_at: row[5],
#       updated_at: row[6]
#     })
#   end
# end

# desc "Import Customers from csv files"
# task :import => [:environment] do
#
#   file = "db/rails_engine_csv/data/customers.csv"
#
#   CSV.foreach(file, :headers => true) do |row|
#     Customer.create ({
#       first_name: row[1],
#       last_name: row[2],
#       created_at: row[3],
#       updated_at: row[4]
#     })
#   end
# end

desc "Import Invoices from csv files"
task :import => [:environment] do

  file = "db/rails_engine_csv/data/invoices.csv"

  CSV.foreach(file, :headers => true) do |row|
    Invoice.create ({
      customer_id: row[1],
      merchant_id: row[2],
      status: row[3],
      created_at: row[4],
      updated_at: row[5]
    })
  end
end

# desc "Import Invoice_items from csv files"
# task :import => [:environment] do
#
#   file = "db/rails_engine_csv/data/invoice_items.csv"
#
#   CSV.foreach(file, :headers => true) do |row|
#     InvoiceItem.create ({
#       item_id: row[1],
#       invoice_id: row[2],
#       quantity: row[3],
#       unit_price: row[4],
#       created_at: row[5],
#       updated_at: row[6]
#     })
#   end
# end
#
# desc "Import Transactions from csv files"
# task :import => [:environment] do
#
#   file = "db/rails_engine_csv/data/transactions.csv"
#
#   CSV.foreach(file, :headers => true) do |row|
#     Transaction.create ({
#       invoice_id: row[1],
#       credit_card_number: row[2],
#       result: row[4],
#       created_at: row[5],
#       updated_at: row[6]
#     })
#   end
# end
