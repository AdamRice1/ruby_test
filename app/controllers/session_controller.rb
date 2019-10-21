class SessionController < ApplicationController
  def home
    session[:user_id] = nil
    render 'logout'
  end
  def logout
    session[:user_id] = nil
    redirect_to '/'
  end
  def create
    if params['user']['password'] == params['user']['confirm_password']
      @user = User.create ( user_params )
      if @user.valid?
        session[:user_id] = User.last.id
        redirect_to '/songs'
      else
        redirect_to '/', alert: @user.errors.full_messages
      end
    else
      redirect_to '/', alert: ['Passwords must match!']
    end
  end

  def login
    @user=User.find_by_email(params['email_login'])
    if @user == nil
      redirect_to '/', alert:  ['Password or Email Error']
    else 
      @user.authenticate(params['password_login'])
      session[:user_id]=@user.id
      redirect_to '/songs'
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
