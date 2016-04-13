FactoryGirl.define do
  factory :transaction do
    invoice nil
    credit_card_number "12345"
    result "MyString"
  end
end
