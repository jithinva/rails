class UserSessionsController < ApplicationController
  skip_before_filter :require_login
  def new
	    @user_session=UserSession.new
      if current_user
        redirect_to:controller=>"categories", :action=>"index"
      end
  end


  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice]="Successfully logged out"
    redirect_to root_url

  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice]="Successfully logged in"
      redirect_to :controller => "categories", :action => "index"
    else
      render :new
    end
  end
end