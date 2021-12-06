FactoryBot.define do
  factory :expense do
    purpose { "Electricity" }
    amount { 150 }
    expense_date { "2021/11/21" }
  end
end
