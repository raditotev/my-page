require 'spec_helper'

describe PagesController do

  describe ".about" do
    it "returns http success" do
      get :about
      expect(response).to be_success
      expect(response).to render_template(:about)
    end
  end

  describe ".portfolio" do
    it "returns http success" do
      get :portfolio
      expect(response).to be_success
      expect(response).to render_template(:portfolio)
    end
  end

  describe ".blog" do
    it "returns http success" do
      get :blog
      expect(response).to be_success
      expect(response).to render_template(:blog)
    end
  end

  describe ".contacts'" do
    it "returns http success" do
      get :contacts
      expect(response).to be_success
      expect(response).to render_template(:contacts)
    end
  end

end
