class PasswordsController < ApplicationController

  def index
    @passwords = Password.all.order(user: :asc)
  end

  def new
    @password = Password.new
  end

  def show
  end

  def edit
  end

  def create
    @password = Password.new(params.require(:password).permit(:url, :user, :password))
    if @password.save
      redirect_to passwords_path
    else
      render new
    end
  end

  def update
    if @password.update(password_params)
      redirect_to passwords_path
    else
      render edit
    end
  end

  def destroy
    @password.destroy
  end

  private
  def set_password
    @password = Password.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def password_params
  end

end
