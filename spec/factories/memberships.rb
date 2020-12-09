FactoryBot.define do
  factory :membership do
    member_id { "KRIM0001" }
    title { "Mr." }
    firstname { "Allan" }
    lastname { "Aikins" }
    othernames { "Papa" }
    gender { "Male" }
    date_of_birth { "1990-06-23" }
    primary_phone_number { 578034667 }
    other_phone_number { 0 }
    email { "allanaikins@gmail.com" }
    hometown { "Mumford" }
    residential_location { "Ashongman Estate A-line" }
    occupation { "Software Engineer" }
    marital_status { "Single" }
    work_place { "Paystack" }
    year_joining_church { 2016 }
    position{"Member"}
  end
end
