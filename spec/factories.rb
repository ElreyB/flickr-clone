FactoryBot.define do
  factory :user do
    username 'rey22'
    email 'rey@test.com'
    password '123456'
    password_confirmation '123456'
  end

  factory :image do
    photo { File.new("#{Rails.root}/spec/support/fixtures/test_image.jpg") }
   end
end
