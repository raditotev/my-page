require 'spec_helper'

RSpec.describe PagesController, type: :controller do

  let(:valid_session) { {} }

  subject { response }

  describe "GET #about" do
    before {get :about}

    it {is_expected.to be_success}
    it {is_expected.to render_template :about}
  end

  describe "GET #portfolio" do
    before {get :portfolio}

    it {is_expected.to be_success}
    it {is_expected.to render_template :portfolio}


    it "assigns all projects as @projects" do
      project = create(:project)
      get :portfolio, params: {}, session: valid_session
      expect(assigns(:projects)).to eq([project])
    end

    it "displays most recent first" do
      project1 = create(:project, title: "Title1")
      project2 = create(:project, title: "Title2")
      get :portfolio, params: {}, session: valid_session
      expect(assigns(:projects)).to eq([project2, project1])
    end
  end

  describe "GET #blog" do
    before {get :blog}

    it {is_expected.to be_success}
    it {is_expected.to render_template :blog}

    it "assigns all posts as @posts" do
      post = create(:post)
      get :blog, params: {}, session: valid_session
      expect(assigns(:posts)).to eq([post])
    end

    it "displays most recent first" do
      post1 = create(:post)
      post2 = create(:post, title: "Title1")
      get :blog, params: {}, session: valid_session
      expect(assigns(:posts)).to eq([post2, post1])
    end

    describe "when tag passed in params" do

      it "returns posts with the same tag"do
        post1 = create(:post, title: "Title1", all_tags: "Tag")
        post2 = create(:post, title: "Title2", all_tags: "Different")
        post3 = create(:post, title: "Title3", all_tags: "Tag")
        get :blog, params: {tag: "TAG"}, session: valid_session
        expect(assigns(:posts)).to eq([post3, post1])
      end
    end
  end
end
