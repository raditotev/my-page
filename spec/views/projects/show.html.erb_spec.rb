require 'spec_helper'

RSpec.describe "projects/show", type: :view do
  before(:each) do
    @project = assign(:project, create(:project))
    render
  end

  it "renders attributes in <p>" do
    expect(rendered).to match(/Project Title/)
    expect(rendered).to match(/Project Text/)
  end
end
