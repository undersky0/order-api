require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe V1::StatusTransitionsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # V1::StatusTransition. As you add validations to V1::StatusTransition, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # V1::StatusTransitionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all v1_status_transitions as @v1_status_transitions" do
      status_transition = V1::StatusTransition.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:v1_status_transitions)).to eq([status_transition])
    end
  end

  describe "GET show" do
    it "assigns the requested v1_status_transition as @v1_status_transition" do
      status_transition = V1::StatusTransition.create! valid_attributes
      get :show, {:id => status_transition.to_param}, valid_session
      expect(assigns(:v1_status_transition)).to eq(status_transition)
    end
  end

  describe "GET new" do
    it "assigns a new v1_status_transition as @v1_status_transition" do
      get :new, {}, valid_session
      expect(assigns(:v1_status_transition)).to be_a_new(V1::StatusTransition)
    end
  end

  describe "GET edit" do
    it "assigns the requested v1_status_transition as @v1_status_transition" do
      status_transition = V1::StatusTransition.create! valid_attributes
      get :edit, {:id => status_transition.to_param}, valid_session
      expect(assigns(:v1_status_transition)).to eq(status_transition)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new V1::StatusTransition" do
        expect {
          post :create, {:v1_status_transition => valid_attributes}, valid_session
        }.to change(V1::StatusTransition, :count).by(1)
      end

      it "assigns a newly created v1_status_transition as @v1_status_transition" do
        post :create, {:v1_status_transition => valid_attributes}, valid_session
        expect(assigns(:v1_status_transition)).to be_a(V1::StatusTransition)
        expect(assigns(:v1_status_transition)).to be_persisted
      end

      it "redirects to the created v1_status_transition" do
        post :create, {:v1_status_transition => valid_attributes}, valid_session
        expect(response).to redirect_to(V1::StatusTransition.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved v1_status_transition as @v1_status_transition" do
        post :create, {:v1_status_transition => invalid_attributes}, valid_session
        expect(assigns(:v1_status_transition)).to be_a_new(V1::StatusTransition)
      end

      it "re-renders the 'new' template" do
        post :create, {:v1_status_transition => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested v1_status_transition" do
        status_transition = V1::StatusTransition.create! valid_attributes
        put :update, {:id => status_transition.to_param, :v1_status_transition => new_attributes}, valid_session
        status_transition.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested v1_status_transition as @v1_status_transition" do
        status_transition = V1::StatusTransition.create! valid_attributes
        put :update, {:id => status_transition.to_param, :v1_status_transition => valid_attributes}, valid_session
        expect(assigns(:v1_status_transition)).to eq(status_transition)
      end

      it "redirects to the v1_status_transition" do
        status_transition = V1::StatusTransition.create! valid_attributes
        put :update, {:id => status_transition.to_param, :v1_status_transition => valid_attributes}, valid_session
        expect(response).to redirect_to(status_transition)
      end
    end

    describe "with invalid params" do
      it "assigns the v1_status_transition as @v1_status_transition" do
        status_transition = V1::StatusTransition.create! valid_attributes
        put :update, {:id => status_transition.to_param, :v1_status_transition => invalid_attributes}, valid_session
        expect(assigns(:v1_status_transition)).to eq(status_transition)
      end

      it "re-renders the 'edit' template" do
        status_transition = V1::StatusTransition.create! valid_attributes
        put :update, {:id => status_transition.to_param, :v1_status_transition => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested v1_status_transition" do
      status_transition = V1::StatusTransition.create! valid_attributes
      expect {
        delete :destroy, {:id => status_transition.to_param}, valid_session
      }.to change(V1::StatusTransition, :count).by(-1)
    end

    it "redirects to the v1_status_transitions list" do
      status_transition = V1::StatusTransition.create! valid_attributes
      delete :destroy, {:id => status_transition.to_param}, valid_session
      expect(response).to redirect_to(v1_status_transitions_url)
    end
  end

end
