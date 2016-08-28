require 'rails_helper'

RSpec.describe PasswordControllerSpec, type: :controller do
  describe "POST #create" do
    it "should create a password" do
      att = {:url => 'gmail.com', :user => 'nome', :password => '123'}
      expect {
        post :create, {:passwords => att}
      }.to change(Password, :count).by(1)
    end

    # it "should create passwords" do
    #   # att = {:url => 'gmail.com', :user => 'nome', :password => '123'}
    #   # expect {
    #   #   post :create, {:passwords => att}
    #   # }.to change(Test, :count).by(1)
    # end
  end
end
