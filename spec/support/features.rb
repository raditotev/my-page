module Features
  module SessionHelpers

    def sign_in
      admin = create(:admin)
      visit new_admin_session_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Log in'
    end
  end
end



RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
end
