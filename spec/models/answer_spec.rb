require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.create(title:"Color of Sky?", body:"What color is it?", resolved:false) }
  let(:answer) { Answer.create(question:question, body:"Blue!") }

  describe "attributes" do
    it "has a body attribute" do
      expect(answer).to have_attributes(body:"Blue!")
    end

    it "responds to body" do
      expect(answer).to respond_to(:body)
    end

    it "responds to question" do
      expect(answer).to respond_to(:question)
    end
  end
end
