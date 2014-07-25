class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_initialize_by(email: params[:user][:email])
    if @user.persisted? && @user.valid_password?(params[:user][:password])
      if @user.confirmed?
        sign_in User, @user
        redirect_to new_session_path
        flash[:notice] = I18n.t('devise.sessions.signed_in')
      else
        redirect_to new_session_path
        flash[:notice] = 'Account inactive or do not confirmed!'
      end
    else
      redirect_to new_session_path
      flash[:alert] = I18n.t('devise.failure.not_found_in_database')
    end
  end

  def destroy
    sign_out(current_user)
    redirect_to new_session_path
    flash[:notice] = 'Your are logout!'
  end

end
