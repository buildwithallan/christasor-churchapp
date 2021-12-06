FactoryBot.define do
  factory :pledge do
    membername { "Nana Appiah" }
    amount { 150 }
    payment { "Paid" }
    remarks { "Pledge towards purchasing of bus" }
    pledge_date {"2021/11/21"}
  end
end
