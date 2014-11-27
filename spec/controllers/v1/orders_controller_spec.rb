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
    response = get :show, {:id => @order.id, token: @user.api_key.token}
    #api_get "orders/#{@order.id}", {token: @user.api_key.token}
    puts JSON.parse(response.body)
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

      it "updates the requested v1_order" do
        order = V1::Order.create! valid_attributes
        put :update, {:id => order.to_param, :v1_order => new_attributes}, valid_session
        order.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested v1_order as @v1_order" do
        order = V1::Order.create! valid_attributes
        put :update, {:id => order.to_param, :v1_order => valid_attributes}, valid_session
        expect(assigns(:v1_order)).to eq(order)
      end

      it "redirects to the v1_order" do
        order = V1::Order.create! valid_attributes
        put :update, {:id => order.to_param, :v1_order => valid_attributes}, valid_session
        expect(response).to redirect_to(order)
      end
    end

    describe "with invalid params" do
      it "assigns the v1_order as @v1_order" do
        order = V1::Order.create! valid_attributes
        put :update, {:id => order.to_param, :v1_order => invalid_attributes}, valid_session
        expect(assigns(:v1_order)).to eq(order)
      end

      it "re-renders the 'edit' template" do
        order = V1::Order.create! valid_attributes
        put :update, {:id => order.to_param, :v1_order => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested v1_order" do
      order = V1::Order.create! valid_attributes
      expect {
        delete :destroy, {:id => order.to_param}, valid_session
      }.to change(V1::Order, :count).by(-1)
    end

    it "redirects to the v1_orders list" do
      order = V1::Order.create! valid_attributes
      delete :destroy, {:id => order.to_param}, valid_session
      expect(response).to redirect_to(v1_orders_url)
    end
  end

end
