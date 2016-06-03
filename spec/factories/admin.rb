FactoryGirl.define do
    factory :admin do
        email "admin@mail.com"
        password "example"
        password_confirmation "example"
    end
end
