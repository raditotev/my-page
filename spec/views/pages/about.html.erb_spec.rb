require 'spec_helper'

RSpec.describe "pages/about", type: :view do

  before(:each) do
    render
  end

  subject{ rendered }


  it { is_expected.to have_css "h3", text: "Hi, and welcome to my page!" }
  it { is_expected.to have_css "img[alt='Hero Image']" }
  it { is_expected.to have_css "h1", text: "HEY, I'M RADI" }
end
