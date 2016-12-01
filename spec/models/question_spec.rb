require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {Question.create(title:"Color of Sky?", body:"What color is it?", resolved:false)}
  describe "attributes" do
    it "has attributes" do
      expect(question).to have_attributes(title:"Color of Sky?", body:"What color is it?", resolved:false)
    end

    it "responds to title" do
      expect(question).to respond_to(:title)
    end

    it "responds to body" do
      expect(question).to respond_to(:body)
    end

    it "responds to resolved" do
      expect(question).to respond_to(:resolved)
    end
  end
end
