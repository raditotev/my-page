FactoryBot.define do
  factory :post do
    title { "Post Title" }
    content { "Post Text" }
    all_tags { "Tag" }
  end
end
