FactoryBot.define do
  factory :user do
    email { "admin@admin.com" }
    password_digest { "admin1234" }
    user_type { "Admin" }
  end
end
