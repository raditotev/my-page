require 'spec_helper'

RSpec.describe "pages/about", type: :view do

  before(:each) do
    render
  end

  subject{ rendered }


  it { is_expected.to have_css "h3", text: "Short Bio" }
  it { is_expected.to have_css "img[alt='My Photo']" }
  it { is_expected.to have_css "h4", text: "Radi Totev" }
  it { is_expected.to have_css "span", text: "London, UK" }
  it { is_expected.to have_link "Google" }
  it { is_expected.to have_link "LinkedIn" }
  it { is_expected.to have_link "GitHub" }
  it { is_expected.to have_link "CV" }
  it { is_expected.to have_css "#intro" }
  it { is_expected.to have_css "h4", text: "Hi, and welcome to my page!" }
end
