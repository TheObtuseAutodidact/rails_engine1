FactoryGirl.define do
  factory :invoice_item do
    item nil
    invoice nil
    quantity ""
    unit_price 15.00
  end
end
