FactoryGirl.define do
  factory :post do
    title "Title"
    content "Text"
    tag1 = Tag.new(name: "Tag")
    tags [tag1]
  end
end
