require 'spec_helper'

RSpec.describe "contacts/new.html.erb", type: :view do
   before(:each) do
    assign(:contact, build(:contact))
    render
  end

  subject{rendered}

it{ is_expected.to have_css "h3", text: "Send message" }

  it "renders new contact form" do
    assert_select "form[action=?][method=?]", contacts_path, "post" do
      assert_select "input#contact_name[name=?]", "contact[name]"
      assert_select "input#contact_email[name=?]", "contact[email]"
      assert_select "textarea#contact_message[name=?]", "contact[message]"
    end
  end
end
