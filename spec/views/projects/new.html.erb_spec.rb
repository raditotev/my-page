require 'spec_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, build(:project))
    render
  end

  it "renders new project form" do


    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input#project_title[name=?]", "project[title]"
      assert_select "textarea#project_description[name=?]", "project[description]"
    end
  end
end
