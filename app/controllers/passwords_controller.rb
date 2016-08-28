class PasswordsController < ApplicationController

  def index
    @passwords = Password.all
  end

  def new
    @password = Password.new
  end

  def show
  end

  def edit
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to 'index'
    else
      render 'new'
    end
  end

  def update
    if @test.update(test_params)
      redirect_to 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @test.destroy
    end
  end

  private
  def set_password
    @password = Password.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def password_params
    params.require(:password).permit(:url, :user, :password)
  end
end
