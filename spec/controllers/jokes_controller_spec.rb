require 'spec_helper'

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

describe JokesController do

  # This should return the minimal set of attributes required to create a valid
  # Joke. As you add validations to Joke, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # JokesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all jokes as @jokes" do
      joke = Joke.create! valid_attributes
      get :index, {}, valid_session
      assigns(:jokes).should eq([joke])
    end
  end

  describe "GET show" do
    it "assigns the requested joke as @joke" do
      joke = Joke.create! valid_attributes
      get :show, {:id => joke.to_param}, valid_session
      assigns(:joke).should eq(joke)
    end
  end

  describe "GET new" do
    it "assigns a new joke as @joke" do
      get :new, {}, valid_session
      assigns(:joke).should be_a_new(Joke)
    end
  end

  describe "GET edit" do
    it "assigns the requested joke as @joke" do
      joke = Joke.create! valid_attributes
      get :edit, {:id => joke.to_param}, valid_session
      assigns(:joke).should eq(joke)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Joke" do
        expect {
          post :create, {:joke => valid_attributes}, valid_session
        }.to change(Joke, :count).by(1)
      end

      it "assigns a newly created joke as @joke" do
        post :create, {:joke => valid_attributes}, valid_session
        assigns(:joke).should be_a(Joke)
        assigns(:joke).should be_persisted
      end

      it "redirects to the created joke" do
        post :create, {:joke => valid_attributes}, valid_session
        response.should redirect_to(Joke.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved joke as @joke" do
        # Trigger the behavior that occurs when invalid params are submitted
        Joke.any_instance.stub(:save).and_return(false)
        post :create, {:joke => { "name" => "invalid value" }}, valid_session
        assigns(:joke).should be_a_new(Joke)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Joke.any_instance.stub(:save).and_return(false)
        post :create, {:joke => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested joke" do
        joke = Joke.create! valid_attributes
        # Assuming there are no other jokes in the database, this
        # specifies that the Joke created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Joke.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => joke.to_param, :joke => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested joke as @joke" do
        joke = Joke.create! valid_attributes
        put :update, {:id => joke.to_param, :joke => valid_attributes}, valid_session
        assigns(:joke).should eq(joke)
      end

      it "redirects to the joke" do
        joke = Joke.create! valid_attributes
        put :update, {:id => joke.to_param, :joke => valid_attributes}, valid_session
        response.should redirect_to(joke)
      end
    end

    describe "with invalid params" do
      it "assigns the joke as @joke" do
        joke = Joke.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Joke.any_instance.stub(:save).and_return(false)
        put :update, {:id => joke.to_param, :joke => { "name" => "invalid value" }}, valid_session
        assigns(:joke).should eq(joke)
      end

      it "re-renders the 'edit' template" do
        joke = Joke.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Joke.any_instance.stub(:save).and_return(false)
        put :update, {:id => joke.to_param, :joke => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested joke" do
      joke = Joke.create! valid_attributes
      expect {
        delete :destroy, {:id => joke.to_param}, valid_session
      }.to change(Joke, :count).by(-1)
    end

    it "redirects to the jokes list" do
      joke = Joke.create! valid_attributes
      delete :destroy, {:id => joke.to_param}, valid_session
      response.should redirect_to(jokes_url)
    end
  end

end
