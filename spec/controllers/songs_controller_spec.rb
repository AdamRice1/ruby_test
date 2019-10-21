require 'rails_helper'

RSpec.describe SongsController, type: :controller do

  describe "GET #create_song" do
    it "returns http success" do
      get :create_song
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show_song" do
    it "returns http success" do
      get :show_song
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show_user" do
    it "returns http success" do
      get :show_user
      expect(response).to have_http_status(:success)
    end
  end

end
