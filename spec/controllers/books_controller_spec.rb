require "rails_helper"

RSpec.describe BooksController, type: :controller do
  # describe "GET #index"
  describe "GET #index" do
    before do
      20.times { FactoryBot.create(:book) }
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template :index
    end

    it "lists books" do
      expect(assigns(:books).length).to eq(21)
    end
  end

  # describe "GET #show"
  describe "GET #show" do
    before do
      book = FactoryBot.create(:book)
      get :show, params: { id: book.id }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      expect(response).to render_template :show
    end

    it "shows the book title" do
      expect(response.body.to_s).to include("Book 1")
    end

    it "shows the book opinion" do
      expect(response.body).to include("Opinion 1")
    end
  end

  # describe "GET #new"
  describe "GET #new" do
    before do
      get :new
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      expect(response).to render_template :new
    end

    it "renders a form" do
      expect(response.body).to include("form")
    end
  end

end
