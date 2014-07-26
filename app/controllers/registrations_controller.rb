class RegistrationsController < ApplicationController

  # Get sign-up
  def new

  end
  # Post sign-up
  def sign_up
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.user_id = '1'
    @user.user_type = 'user'
    if @user.valid_password?(params[:user][:password])
      @user.skip_confirmation!
      @user.save
      redirect_to index_path
      flash[:notice] = I18n.t('devise.registrations.signed_up')
    else
      render :new
      flash[:alert] = 'Signed error!'
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
