require 'spec_helper'

RSpec.describe PagesController, type: :controller do

  subject { response }

  describe ".about" do
    before {get :about}

    it {is_expected.to be_success}
    it {is_expected.to render_template :about}
  end

  describe ".portfolio" do
    before {get :portfolio}

    it {is_expected.to be_success}
    it {is_expected.to render_template :portfolio}
  end

  describe ".blog" do
    before {get :blog}

    it {is_expected.to be_success}
    it {is_expected.to render_template :blog}
  end

  describe ".contacts'" do
    before {get :contacts}

    it {is_expected.to be_success}
    it {is_expected.to render_template :contacts}
  end

end
