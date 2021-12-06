FactoryBot.define do
  factory :tithe do
    membership { 1}
    amount { 100.00 }
    tithe_date {"2021/11/23"}
  end
end
