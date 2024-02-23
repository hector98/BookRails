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
      expect(assigns(:books).length).to eq(22)
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
  end

  #describe "POST #create"
  describe "POST #create" do
    it "redirects to books_path" do
      post :create, params: { book: { title: "Title", opinion: "Opinion" } }
      expect(response).to redirect_to books_path
    end

    it "render to new if title is blank" do
      post :create, params: { book: { title: "", opinion: "Opinion" } }
      expect(response).to render_template :new
    end

    it "render to new if opinion is blank" do
      post :create, params: { book: { title: "Title", opinion: "" } }
      expect(response).to render_template :new
    end

    it "render to new if title and opinion are blank" do
      post :create, params: { book: { title: "", opinion: "" } }
      expect(response).to render_template :new
    end

    it "returns http unprocessable_entity" do
      post :create, params: { book: { title: "", opinion: "Opinion" } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  #describe "GET #edit"
  describe "GET #edit" do
    before do
      book = FactoryBot.create(:book)
      get :edit, params: { id: book.id }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      expect(response).to render_template :edit
    end
  end

  #describe "PUT #update"
  describe "PUT #update" do
    let!(:book) { FactoryBot.create(:book) }

    it "redirects to books_path" do
      put :update, params: { id: book.id, book: { title: "Title edit", opinion: "Opinion edit" } }
      expect(response).to redirect_to book
    end

    it "render to edit if title is blank" do
      put :update, params: { id: book.id, book: { title: "", opinion: "Opinion" } }
      expect(response).to render_template :edit
    end

    it "render to edit if opinion is blank" do
      put :update, params: { id: book.id, book: { title: "Title", opinion: "" } }
      expect(response).to render_template :edit
    end

    it "render to edit if title and opinion are blank" do
      put :update, params: { id: book.id, book: { title: "", opinion: "" } }
      expect(response).to render_template :edit
    end
  end

  #describe "DELETE #destroy"
  describe "DELETE #destroy" do
    let!(:book) { FactoryBot.create(:book) }

    it "redirects to books_path" do
      delete :destroy, params: { id: book.id }
      expect(response).to redirect_to books_path
    end

    it "returns http success" do
      delete :destroy, params: { id: book.id }
      expect(response).to have_http_status(:success)
    end
  end

end
