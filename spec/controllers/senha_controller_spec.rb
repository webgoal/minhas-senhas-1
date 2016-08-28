require 'rails_helper'

RSpec.describe PasswordController, type: :controller do

  describe "GET #show" do
    it "assigns the requested senha " do
      senha = Password.create
      get :show
      expect(assigns(:senha)).to eq(senha)
    end
  end

end
