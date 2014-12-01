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
      expect(assigns(:v1_products)).to match_array([@product, @product2, V1::Product.first])
      expect(response.status).to eq 200
      puts "index:  + #{response.body}"
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

    end
  end

  describe "POST create", :skip_before do
    before :each do 
      @products = FactoryGirl.attributes_for(:v1_product)
    end
    
    describe "with valid params" do
      it "creates a new V1::Product" do
        @itemline = FactoryGirl.create(:v1_item_line)
        expect {
          post :create, :v1_product => {name: "test1", net_price: 101, item_line_id: @itemline.id}, token: @user.api_key.token
        }.to change(V1::Product, :count).by(1)
        expect(V1::Product.last.name).to eq "test1"
        expect(V1::Product.last.net_price).to eq 101
        expect(response.status).to eq 201
        expect(response.message).to eq "Created"
      end
      it "fails without token" do
        expect {
          post :create, :v1_product => {name: "test", net_price: 10 }
        }.to change(V1::Product, :count).by(0)
        expect(response.status).to eq 401
        expect(response.message).to eq "Unauthorized"
        r = JSON.parse(response.body)
        expect(r["message"]).to eq "Invalid API Token"
        puts "RESPONSE STATUS: #{response.status} message #{response.message} m #{response.body}"
      end
      it "name & price not uniq" do
        FactoryGirl.create(:v1_product, name: "test", net_price: 10)
        expect {
          post :create, :v1_product => {name: "test", net_price: 10 }, token: @user.api_key.token
        }.to change(V1::Product, :count).by(0)
        r = JSON.parse(response.body)
        expect(r["name"]).to eq ["must be unique"]
        expect(r["net_price"]).to eq ["must be unique"]
        expect(response.status).to eq 422
        puts response.status
      end       
      
      it "product belongs_to itemline",:skip_before do
          @itemline = FactoryGirl.create(:v1_item_line)
          @product = FactoryGirl.create(:v1_product, item_line: @itemline)
          expect(@product.item_line_id).to eq 4
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
        {name: "teststs"}
      }

      it "updates the requested v1_product" do  
        put :update, {:id => @product, :v1_product => new_attributes}, token: @user.api_key.token
        puts response.body.inspect
        @product.reload
        expect(@product.name).to eq "teststs"
      end

      it "assigns the requested v1_product as @v1_product" do
        product = V1::Product.create! valid_attributes
        put :update, {:id => @product, :v1_product => new_attributes}, token: @user.api_key.token
        expect(assigns(:v1_product)).to eq(@product)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested v1_product" do
      product = @product
      expect {
        delete :destroy, {:id => product.to_param}, token: @user.api_key.token
      }.to change(V1::Product, :count).by(-1)
    end
  end
  
  describe "INVALID DELETE", :skip_before do
    it "returns status 401" do
      product = FactoryGirl.create(:v1_product, name: "dsadsa", net_price: 321, item_line_id: 1)
      FactoryGirl.create(:v1_order)
      FactoryGirl.create(:v1_item_line, quantity: 2, order_id: 1)
      expect {
        delete :destroy, {:id => product.to_param}, token: @user.api_key.token
      }.to change(V1::Product, :count).by(0)
      expect(response.status).to eq 401
      r = JSON.parse(response.body)
      expect(r["message"]).to eq "Someone has ordered this product"
    end
    end
  end

