require 'spec_helper'

RSpec.describe "projects/show", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      attributes_for(:project)
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Project Title/)
    expect(rendered).to match(/Project Text/)
  end
end
