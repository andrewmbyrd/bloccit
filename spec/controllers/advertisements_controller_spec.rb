require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
let(:my_ad) { Advertisement.create!(title:"Product", body:"Description", price:100) }
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end



  #end get index
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
       get :show, {id: my_ad.id}
       expect(response).to render_template :show
     end

     it "assigns my_post to @post" do
       get :show, {id: my_ad.id}
       expect(assigns(:advertisement)).to eq(my_ad)
     end

  #end get show
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
        get :new
        expect(response).to render_template :new
    end

    it "instantiates @advertisement" do
        get :new
        expect(assigns(:advertisement)).not_to be_nil
    end

  #end get new
  end

  describe "POST #create" do

    it "increases the number of Advertisement by 1" do
        expect{post :create, advertisement: {title: "t", body: "b", price:20}}.to change(Advertisement,:count).by(1)
    end

    it "assigns the new ad to @advertisement" do
        post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price:30}
        expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new ad" do
        post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 30}
        expect(response).to redirect_to Advertisement.last
      end


  #end post create
  end

end
