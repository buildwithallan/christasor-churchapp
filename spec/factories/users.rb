FactoryBot.define do
  factory :user do
    email { "superadmin@admin.com" }
    password_digest { "superadmin1234" }
    user_type { "Superadmin" }
  end
end
