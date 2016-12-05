require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:my_quest) { Question.create!(title:"How long", body:"the day?", resolved:false)}
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_quest] to @questions" do
      get :index
# #9
      expect(assigns(:questions)).to eq([my_quest])
    end
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

# #3
    it "instantiates @post" do
      get :new
      expect(assigns(:question)).not_to be_nil
    end
  end

  describe "GET #create" do

    it "increases the rows in Question by 1" do
      expect{post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved:false}}.to change(Question,:count).by(1)
    end

# #5
    it "assigns the new post to @post" do
      post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false}
      expect(assigns(:question)).to eq Question.last
    end

# #6
    it "redirects to the new post" do
      post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved:false}
      expect(response).to redirect_to Question.last
    end

  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_quest.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
       get :show, {id: my_quest.id}
       expect(response).to render_template :show
     end

     it "assigns my_post to @post" do
       get :show, {id: my_quest.id}
       expect(assigns(:question)).to eq(my_quest)
     end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: my_quest.id}
      expect(response).to render_template :edit
    end

    it "renders the #edit view" do
       get :edit, {id: my_quest.id}
 # #1
       expect(response).to render_template :edit
     end
     #2
     it "assigns post to be updated to @post" do
       get :edit, {id: my_quest.id}

       post_instance = assigns(:question)

       expect(post_instance.id).to eq my_quest.id
       expect(post_instance.title).to eq my_quest.title
       expect(post_instance.body).to eq my_quest.body
     end
  end

  describe "PUT #update" do

    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph


      put :update, id: my_quest.id, question: {title: new_title, body: new_body, resolved:false}


      updated_question = assigns(:question)
      expect(updated_question.id).to eq my_quest.id
      expect(updated_question.title).to eq new_title
      expect(updated_question.body).to eq new_body
    end

    it "redirects to the updated question" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph


      put :update, id: my_quest.id, question: {title: new_title, body: new_body, resolved: false}
      expect(response).to redirect_to my_quest
    end

  end

  describe "GET #destroy" do
    it "deletes the post" do
      delete :destroy, {id: my_quest.id}
# #6
      count = Question.where({id: my_quest.id}).size
      expect(count).to eq 0
    end

    it "redirects to posts index" do
      delete :destroy, {id: my_quest.id}
# #7
      expect(response).to redirect_to questions_path
    end

  end

end
