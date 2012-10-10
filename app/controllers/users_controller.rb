class UsersController < ApplicationController
  def edit
	@user = current_user
  end

  def new
	@user = Employee.new
  end

  def create
	    @user = Employee.new(params[:user])
            @name=params[:user][:username]
            @user.password=@name+"123"
            @user.password_confirmation=@name+"123"
	    if @user.save
		  flash[:notice]="Registration successful"
        	redirect_to :controller=>"categories",:action=>"index"
        else
        	render :new
        end
 end

    def update
	    @user=current_user
	    if @user.update_attributes(params[:user])
     	flash[:notice]="Successfully updated profile"
	   redirect_to :controller=>"categories",:action=>"index"
	else
		render:action=>'edit'
	end
 end
end
