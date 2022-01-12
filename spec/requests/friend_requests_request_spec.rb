require 'rails_helper'

RSpec.describe "FriendRequests", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/friend_requests/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /send" do
    it "returns http success" do
      get "/friend_requests/send"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /accept" do
    it "returns http success" do
      get "/friend_requests/accept"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /decline" do
    it "returns http success" do
      get "/friend_requests/decline"
      expect(response).to have_http_status(:success)
    end
  end

end
