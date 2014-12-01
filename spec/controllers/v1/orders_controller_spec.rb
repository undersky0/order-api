require 'rails_helper'
require 'spec_helper'
require 'api_helper'

RSpec.describe V1::OrdersController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # V1::Order. As you add validations to V1::Order, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # V1::OrdersController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  
  
  before(:each) do 
    @user = FactoryGirl.create(:v1_user)
    @order = FactoryGirl.create(:v1_order)
  end
  
  it 'should return a single order' do

  end
  

  describe "GET index" do
    it "assigns all v1_orders as @v1_orders" do
      order = V1::Order.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:v1_orders)).to eq([order])
    end
  end

  describe "GET show" do
    it "assigns the requested v1_order as @v1_order" do
     response = get :show, {:id => @order.id}, token: @user.api_key.token
     #get "orders/#{@order.id}", {token: @user.api_key.token}
    # puts JSON.parse(response.body)
     expect(response.status).to eq 200
    end
  end

  # describe "GET new" do
    # it "assigns a new v1_order as @v1_order" do
      # get :new, {}, valid_session
      # expect(assigns(:v1_order)).to be_a_new(V1::Order)
    # end
  # end

  describe "GET edit" do
    it "assigns the requested v1_order as @v1_order" do
      order = V1::Order.create! valid_attributes
      get :edit, {:id => order.to_param}, valid_session
      expect(assigns(:v1_order)).to eq(order)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "create a new line item with order" do
        expect {
          post :create, 
          v1_order: FactoryGirl.attributes_for(:v1_order, state: 0,
          item_lines_attributes: [:quantity => 2, :net_price => 10.1]), token: @user.api_key.token
        }.to change(V1::Order, :count).by(1)
        expect(V1::ItemLine.last.quantity).to eq 2
        expect(V1::ItemLine.last.net_price).to eq 10.1
      end
      
      
      it "creates a new V1::Order" do
        expect {
          post :create, {:v1_order => valid_attributes}, valid_session
        }.to change(V1::Order, :count).by(1)
      end

      it "assigns a newly created v1_order as @v1_order" do
        post :create, {:v1_order => valid_attributes}, valid_session
        expect(assigns(:v1_order)).to be_a(V1::Order)
        expect(assigns(:v1_order)).to be_persisted
      end

      it "redirects to the created v1_order" do
        post :create, {:v1_order => valid_attributes}, valid_session
        expect(response).to redirect_to(V1::Order.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved v1_order as @v1_order" do
        post :create, {:v1_order => invalid_attributes}, valid_session
        expect(assigns(:v1_order)).to be_a_new(V1::Order)
      end

      it "re-renders the 'new' template" do
        post :create, {:v1_order => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }
      
      before(:each) do
        @order = FactoryGirl.create(:v1_order)
        @item = FactoryGirl.create(:v1_item_line, order_id: @order.id)
        @item2 = FactoryGirl.create(:v1_item_line, order_id: @order.id)
        @item3 = FactoryGirl.attributes_for(:v1_item_line, order_id: @order.id)
      end

      it "updates the requested v1_order" do
        order = FactoryGirl.create(:v1_order)
        put :update, {:id => order.id, :v1_order => {vat: 10, state: 1}}, token: @user.api_key.token
        order.reload
        expect(order.vat).to eq 10
      end
      
      it "updates line item" do
        @order2 = FactoryGirl.create(:v1_order, state: 1)
        @item = FactoryGirl.create(:v1_item_line, order_id: @order2.id)
        @item2 = FactoryGirl.create(:v1_item_line, order_id: @order2.id)
        put :update,  :id => @order2.id, :v1_order => {item_lines_attributes: [:id => 2, :quantity => 4, :net_price => 80.1]}, token: @user.api_key.token
        @order2.reload
        @item2.reload
        r = JSON.parse(response.body)
        expect(r["message"]).to eq "Can be edited only when in draft(0) state"
        expect(response.status).to eq 400
      end
      
      it "update line item invalid" do
        @order2 = FactoryGirl.create(:v1_order, state: 0)
        @item = FactoryGirl.create(:v1_item_line, order_id: @order2.id)
        @item2 = FactoryGirl.create(:v1_item_line, order_id: @order2.id)
        put :update,  :id => @order2.id, :v1_order => {vat: "dsadas", item_lines_attributes: [:id => @item.id, :quantity => "invalid", :net_price => 80.1]}, token: @user.api_key.token
        @order2.reload
        @item.reload
        expect(response.status).to eq 422 
      end
      
      it "can only be edit in draft state" do
         put :update,  :id => @order.id, :v1_order => {item_lines_attributes: [:id => @item2.id, :quantity => 4, :net_price => 80.1]}, token: @user.api_key.token
         @order.reload
         @item2.reload
         expect(@item2.net_price).to eq 80.1.to_d
         expect(@item2.quantity).to eq 4
      end
      

      it "assigns the requested v1_order as @v1_order" do

        put :update, {:id => @order.to_param, :v1_order => valid_attributes}, valid_session
        expect(assigns(:v1_order)).to eq(order)
      end
    end

    describe "with invalid params" do
      it "assigns the v1_order as @v1_order" do
        put :update, {:id => @order.to_param, :v1_order => {vat:"invalid"}}, valid_session
        expect(assigns(:v1_order)).to eq(@order)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested v1_order" do
      expect {
        delete :destroy, {:id => @order.id}, valid_session
      }.to change(V1::Order, :count).by(-1)
    end
  end

end
