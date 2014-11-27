require 'rails_helper'
require 'spec_helper'
require 'api_helper'

RSpec.describe V1::ProductsController, :type => :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }
  let(:valid_session) { {} }
  
  before(:each) do |example|
    @user = FactoryGirl.create(:v1_user)
    unless example.metadata[:skip_before]
    @product = FactoryGirl.create(:v1_product)
    @product2 = FactoryGirl.create(:v1_product, net_price: '10')
    @itemline = FactoryGirl.create(:v1_item_line)
    end
  end
  

  describe "GET index" do
    it "assigns all v1_products as @v1_products" do
      get :index, {token: @user.api_key.token}
      expect(assigns(:v1_products)).to match_array([@product, @product2])
      expect(response.status).to eq 200
      puts "index:  + #{JSON.parse(response.body)}"
    end 
    it "response 404", :skip_before do
      get :index, {token: @user.api_key.token}
      expect(response.status).to eq 404
      puts "index:  + #{JSON.parse(response.body)}"
    end
  end

  describe "GET show" do
    it "assigns the requested v1_product as @v1_product" do
    response = get :show, {:id => @product.id, token: @user.api_key.token}
    puts "show:  + #{JSON.parse(response.body)}"
    expect(response.status).to eq 200
    end
  end


  describe "GET edit" do
    it "assigns the requested v1_product as @v1_product" do
      product = V1::Product.create! valid_attributes
      get :edit, {:id => product.to_param}, valid_session
      expect(assigns(:v1_product)).to eq(product)
    end
  end

  describe "POST create" do
    before :each do 
      @products = FactoryGirl.attributes_for(:v1_product)
    end
    
    describe "with valid params" do
      it "creates a new V1::Product" do
        expect {
          post :create, :v1_product => {name: "test", price: 10 }, token: @user.api_key.token
        }.to change(V1::Product, :count).by(1)
        expect(V1::Product.last.name).to eq "test"
      end
      it "fails without token" do
        expect {
          post :create, :v1_product => {name: "test", price: 10 }
        }.to change(V1::Product, :count).by(0)
        expect(response.status).to eq 401
        expect(response.message).to eq "Unauthorized"
        r = JSON.parse(response.body)
        expect(r["message"]).to eq "Invalid API Token"
        puts "RESPONSE STATUS: #{response.status} message #{response.message} m #{response.body}"
      end       

      it "assigns a newly created v1_product as @v1_product" do
        post :create, {:v1_product => valid_attributes}, valid_session
        expect(assigns(:v1_product)).to be_a(V1::Product)
        expect(assigns(:v1_product)).to be_persisted
      end

      it "redirects to the created v1_product" do
        post :create, {:v1_product => valid_attributes}, valid_session
        expect(response).to redirect_to(V1::Product.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved v1_product as @v1_product" do
        post :create, {:v1_product => invalid_attributes}, valid_session
        expect(assigns(:v1_product)).to be_a_new(V1::Product)
      end

      it "re-renders the 'new' template" do
        post :create, {:v1_product => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested v1_product" do
        product = V1::Product.create! valid_attributes
        put :update, {:id => product.to_param, :v1_product => new_attributes}, valid_session
        product.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested v1_product as @v1_product" do
        product = V1::Product.create! valid_attributes
        put :update, {:id => product.to_param, :v1_product => valid_attributes}, valid_session
        expect(assigns(:v1_product)).to eq(product)
      end

      it "redirects to the v1_product" do
        product = V1::Product.create! valid_attributes
        put :update, {:id => product.to_param, :v1_product => valid_attributes}, valid_session
        expect(response).to redirect_to(product)
      end
    end

    describe "with invalid params" do
      it "assigns the v1_product as @v1_product" do
        product = V1::Product.create! valid_attributes
        put :update, {:id => product.to_param, :v1_product => invalid_attributes}, valid_session
        expect(assigns(:v1_product)).to eq(product)
      end

      it "re-renders the 'edit' template" do
        product = V1::Product.create! valid_attributes
        put :update, {:id => product.to_param, :v1_product => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested v1_product" do
      product = V1::Product.create! valid_attributes
      expect {
        delete :destroy, {:id => product.to_param}, valid_session
      }.to change(V1::Product, :count).by(-1)
    end

    it "redirects to the v1_products list" do
      product = V1::Product.create! valid_attributes
      delete :destroy, {:id => product.to_param}, valid_session
      expect(response).to redirect_to(v1_products_url)
    end
  end

end
