require 'rails_helper'

describe ProductsController do
  before do
    @user = FactoryGirl.create :user
    @product = FactoryGirl.create :product
  end
  describe "GET #index" do
    it "has an array of products" do
      get :index
      assigns(:products).should eq([@product])
    end
    it "renders :index" do
      get :index
      expect(response).to render_template(:index)
    end
    it "render root if #destroy" do
      sign_in @user
      delete :destroy, id: @product
      response.should redirect_to '/'
    end
  end

  describe "GET #show" do
    it "assign requested product to @product" do

    end
  end

end