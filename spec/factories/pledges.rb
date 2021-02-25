FactoryBot.define do
  factory :pledge do
    membername { "MyString" }
    amount { 1.5 }
    payment { "MyString" }
    remarks { "MyText" }
  end
end
