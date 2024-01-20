require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET #index" do

    it "assigns all articles to @articles" do
      get articles_path
      expect(assigns(:articles)).to eq(Article.all)
    end

    it "returns http success" do
      get articles_path
      expect(response).to have_http_status(:success)
    end

    it "renders the correct home template" do
      get root_path
      expect(response).to render_template(:home)
    end

    it "renders the correct about template" do
      get about_path
      expect(response).to render_template(:about)
    end

    it "renders the correct index template" do
      @article = Article.create(title: "Controller test title", description: "Controller test description")
      get article_path(@article)
      expect(response).to render_template(:show)
    end

    it "render the correct new article template" do
      get new_article_path
      expect(response).to render_template(:new)
    end

    it "renders the correct edit tamplate" do
      article = Article.create(title: "Test title", description: "This is test description")
      get edit_article_path(article)
      expect(response).to render_template(:edit)
    end
  end
end
