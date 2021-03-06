require 'spec_helper'

RSpec.describe "projects/edit", type: :view do
  before(:each) do
    @project = assign(:project, create(:project))
    render
  end

  it "renders the edit project form" do

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_title[name=?]", "project[title]"
      assert_select "textarea#project_description[name=?]", "project[description]"
    end
  end
end
