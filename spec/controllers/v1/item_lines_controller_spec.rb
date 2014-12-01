require 'rails_helper'
RSpec.describe V1::ItemLinesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # V1::ItemLine. As you add validations to V1::ItemLine, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # V1::ItemLinesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all v1_item_lines as @v1_item_lines" do
      item_line = V1::ItemLine.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:v1_item_lines)).to eq([item_line])
    end
  end

  describe "GET show" do
    it "assigns the requested v1_item_line as @v1_item_line" do
      item_line = V1::ItemLine.create! valid_attributes
      get :show, {:id => item_line.to_param}, valid_session
      expect(assigns(:v1_item_line)).to eq(item_line)
    end
  end

  describe "GET edit" do
    it "assigns the requested v1_item_line as @v1_item_line" do
      item_line = V1::ItemLine.create! valid_attributes
      get :edit, {:id => item_line.to_param}, valid_session
      expect(assigns(:v1_item_line)).to eq(item_line)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new V1::ItemLine" do
        expect {
          post :create, {:v1_item_line => valid_attributes}, valid_session
        }.to change(V1::ItemLine, :count).by(1)
      end

      it "assigns a newly created v1_item_line as @v1_item_line" do
        post :create, {:v1_item_line => valid_attributes}, valid_session
        expect(assigns(:v1_item_line)).to be_a(V1::ItemLine)
        expect(assigns(:v1_item_line)).to be_persisted
      end

      it "redirects to the created v1_item_line" do
        post :create, {:v1_item_line => valid_attributes}, valid_session
        expect(response).to redirect_to(V1::ItemLine.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved v1_item_line as @v1_item_line" do
        post :create, {:v1_item_line => invalid_attributes}, valid_session
        expect(assigns(:v1_item_line)).to be_a_new(V1::ItemLine)
      end

      it "re-renders the 'new' template" do
        post :create, {:v1_item_line => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested v1_item_line" do
        item_line = V1::ItemLine.create! valid_attributes
        put :update, {:id => item_line.to_param, :v1_item_line => new_attributes}, valid_session
        item_line.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested v1_item_line as @v1_item_line" do
        item_line = V1::ItemLine.create! valid_attributes
        put :update, {:id => item_line.to_param, :v1_item_line => valid_attributes}, valid_session
        expect(assigns(:v1_item_line)).to eq(item_line)
      end

      it "redirects to the v1_item_line" do
        item_line = V1::ItemLine.create! valid_attributes
        put :update, {:id => item_line.to_param, :v1_item_line => valid_attributes}, valid_session
        expect(response).to redirect_to(item_line)
      end
    end

    describe "with invalid params" do
      it "assigns the v1_item_line as @v1_item_line" do
        item_line = V1::ItemLine.create! valid_attributes
        put :update, {:id => item_line.to_param, :v1_item_line => invalid_attributes}, valid_session
        expect(assigns(:v1_item_line)).to eq(item_line)
      end

      it "re-renders the 'edit' template" do
        item_line = V1::ItemLine.create! valid_attributes
        put :update, {:id => item_line.to_param, :v1_item_line => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested v1_item_line" do
      item_line = V1::ItemLine.create! valid_attributes
      expect {
        delete :destroy, {:id => item_line.to_param}, valid_session
      }.to change(V1::ItemLine, :count).by(-1)
    end

    it "redirects to the v1_item_lines list" do
      item_line = V1::ItemLine.create! valid_attributes
      delete :destroy, {:id => item_line.to_param}, valid_session
      expect(response).to redirect_to(v1_item_lines_url)
    end
  end

end
