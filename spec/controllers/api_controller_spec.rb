require 'spec_helper'

describe ApiController do
  let(:valid_attributes) { { type: "photo_exist", path: "not_exist_in_db" } }
  let(:valid_session) { {} }

  describe "POST index:photo_exist" do
    it "assigns response as @response" do
      response = Api.create! valid_attributes
      post :index, valid_attributes, valid_session
      expect(assigns(:response)).to eq(response)
    end
  end
end
