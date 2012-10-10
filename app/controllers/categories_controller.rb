class CategoriesController < ApplicationController
  def index
    @categories=Category.find(:all)
  end
  def new
    if current_user.type=="Master"
    @category=Category.new
    end
  end

  def edit
    if current_user.type=="Master"
    @category=Category.find(params[:id])
    end
  end

  def create
    if current_user.type=="Master"
     @category=Category.new(params[:category])
     if @category.save
         flash[:notice]="Save successfully"
         redirect_to :controller=>"categories",:action=>"index"
     else
       render :new

     end
    end
  end
  def update
    if current_user.type=="Master"
    @category=Category.find(params[:id])
    if @category.update_attributes(params[:category])
		flash[:notice] = 'Category Updated.'
		redirect_to :controller=>"categories",:action=>"index"
	else 
		render :edit
	end
    end
  end
  def destroy
    @category=Category.find(params[:id])
    @category.destroy
    redirect_to :controller=>"categories",:action=>"index"
  end
  def employee_list
    @employee=User.find_all_by_type("Employee")
  end
end
