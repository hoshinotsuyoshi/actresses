require 'spec_helper'

describe ApiController do
  let(:valid_attributes) { { path: "not_exist_in_db" } }
  let(:valid_session) { {} }

  describe "POST validate" do
    it "assigns api as @api" do
      api = Api.create! valid_attributes
      post :validate, {},valid_session
      expect(assigns(:api)).to eq(api)
    end
  end
end
