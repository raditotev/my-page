FactoryBot.define do
  factory :comment do
    author { "Author" }
    email { "example@mail.com" }
    content { "Content" }
    post
  end
end
