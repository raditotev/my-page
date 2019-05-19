FactoryBot.define do
  factory :project do
    title { "Project Title" }
    description { "Project Text" }
    screenshot { fixture_file_upload "#{Rails.root}/spec/support/images/test_img.png", 'image/png' }
    github_url { "www.github.com" }
    demo_url { "www.demo.com" }
  end
end
