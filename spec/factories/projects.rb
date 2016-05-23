FactoryGirl.define do
  factory :project do
    title "MyTitle"
    description "MyText"
    screenshot { fixture_file_upload "#{Rails.root}/spec/support/images/test_img.png", 'image/png' }
    # screenshot { File.new(Rails.root + 'spec/support/images/test_img.png') }
    # screenshot { fixture_file_upload(Rails.root.join('spec/support/images/test_img.png'), 'image/png') }
  end
end
