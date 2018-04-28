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

RSpec.describe BlocksController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Block. As you add validations to Block, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BlocksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all blocks as @blocks" do
      block = Block.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:blocks)).to eq([block])
    end
  end

  describe "GET show" do
    it "assigns the requested block as @block" do
      block = Block.create! valid_attributes
      get :show, {:id => block.to_param}, valid_session
      expect(assigns(:block)).to eq(block)
    end
  end

  describe "GET edit" do
    it "assigns the requested block as @block" do
      block = Block.create! valid_attributes
      get :edit, {:id => block.to_param}, valid_session
      expect(assigns(:block)).to eq(block)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Block" do
        expect {
          post :create, {:block => valid_attributes}, valid_session
        }.to change(Block, :count).by(1)
      end

      it "assigns a newly created block as @block" do
        post :create, {:block => valid_attributes}, valid_session
        expect(assigns(:block)).to be_a(Block)
        expect(assigns(:block)).to be_persisted
      end

      it "redirects to the created block" do
        post :create, {:block => valid_attributes}, valid_session
        expect(response).to redirect_to(Block.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved block as @block" do
        post :create, {:block => invalid_attributes}, valid_session
        expect(assigns(:block)).to be_a_new(Block)
      end

      it "re-renders the 'new' template" do
        post :create, {:block => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested block" do
        block = Block.create! valid_attributes
        put :update, {:id => block.to_param, :block => new_attributes}, valid_session
        block.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested block as @block" do
        block = Block.create! valid_attributes
        put :update, {:id => block.to_param, :block => valid_attributes}, valid_session
        expect(assigns(:block)).to eq(block)
      end

      it "redirects to the block" do
        block = Block.create! valid_attributes
        put :update, {:id => block.to_param, :block => valid_attributes}, valid_session
        expect(response).to redirect_to(block)
      end
    end

    describe "with invalid params" do
      it "assigns the block as @block" do
        block = Block.create! valid_attributes
        put :update, {:id => block.to_param, :block => invalid_attributes}, valid_session
        expect(assigns(:block)).to eq(block)
      end

      it "re-renders the 'edit' template" do
        block = Block.create! valid_attributes
        put :update, {:id => block.to_param, :block => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested block" do
      block = Block.create! valid_attributes
      expect {
        delete :destroy, {:id => block.to_param}, valid_session
      }.to change(Block, :count).by(-1)
    end

    it "redirects to the blocks list" do
      block = Block.create! valid_attributes
      delete :destroy, {:id => block.to_param}, valid_session
      expect(response).to redirect_to(blocks_url)
    end
  end

end
