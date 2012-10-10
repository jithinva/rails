class CommoditiesController < ApplicationController
  
  def index
		 @category = Category.find(params[:category_id])
     @commodities = @category.commodities	 
	end

  def new
    if current_user.type=="Master"
     @category = Category.find(params[:category_id])
     @commodity = @category.commodities.build
    end
  end

  def edit
    if current_user.type=="Master"
    @category = Category.find(params[:category_id])
    @commodity = @category.commodities.find(params[:id])
    end
  end
  def create
    if current_user.type=="Master"
    @category = Category.find(params[:category_id])
    @commodity = @category.commodities.build(params[:commodity])
    #@intake=params[:commodity][:intake_amt]
    if @commodity.save
      #Intake.create!(:user_id=>current_user.id,:commodity_id=>@commodity.id, :intake_amt=>@intake)
      redirect_to :controller=>"commodities",:action=>"index"
    else
      render :new
    end
    end
  end
   def update
     if current_user.type=="Master"
     @category = Category.find(params[:category_id])
     @commodity = Commodity.find(params[:id])
     if @commodity.update_attributes(params[:commodity])
       redirect_to :controller=>"commodities",:action=>"index"
     else
       render :edit
     end
     end
   end
   def destroy
      @category = Category.find(params[:category_id])
      @commodity = Commodity.find(params[:id])
      @commodity.destroy
      redirect_to:controller=>"commodities",:action=>"index"
   end
   def admin_details
     if current_user.type=="Master"
      @intakes=Intake.find(:all)
      @outflows=Outflow.find(:all)
     end
   end
   def employee_details

     @outflows=Outflow.find_all_by_user_id(current_user)
   end
   def admin_report
      @intake_reports=Intake.find(:all)
      @outflow_reports=Outflow.find(:all)
     if request.post?
       
      @start=params[:report][:start_date].to_date unless params[:report][:start_date]==""
      @end=params[:report][:end_date].to_date unless params[:report][:end_date]==""
      if !@start.present? and !@end.present?
        @intake_reports=Intake.find(:all)
        @outflow_reports=Outflow.find(:all)
      else if @start.present? and !@end.present?
          @intake_reports=Intake.find(:all, :conditions => ['created_at >= ?', @start])
          @outflow_reports=Outflow.find(:all, :conditions => ['created_at >= ?', @start])
      else if !@start.present? and @end.present?
         @intake_reports=Intake.find(:all, :conditions => ['created_at <= ?', @end])
         @outflow_reports=Outflow.find(:all, :conditions => ['created_at <= ?', @end])
      else
        @intake_reports=Intake.find(:all, :conditions => ['created_at >= ? AND created_at <= ?', @start, @end])
        @outflow_reports=Outflow.find(:all, :conditions => ['created_at >= ? AND created_at <= ?', @start, @end])
      end
      end
      end
     end
   end

   def employee_report
     @outflow_reports=Outflow.find_all_by_user_id(current_user)
     if request.post?

      @start=params[:report][:start_date].to_date unless params[:report][:start_date]==""
      @end=params[:report][:end_date].to_date unless params[:report][:end_date]==""
      if !@start.present? and !@end.present?
         @outflow_reports=Outflow.find_all_by_user_id(current_user)
      else if @start.present? and !@end.present?
          @outflow_reports=Outflow.find_all_by_user_id(current_user).reject{|i| !(i.created_at.to_date >= @start)}
      else if  !@start.present? and @end.present?
          @outflow_reports=Outflow.find_all_by_user_id(current_user).reject{|i| !(i.created_at.to_date <= @end)}
      else
      @outflow_reports=Outflow.find_all_by_user_id(current_user).reject{|i| !(i.created_at.to_date >= @start and i.created_at.to_date <= @end)}
     end
      end
      end
   end
   end
   def commodity_details
     commodity_id = params[:report][:commodity_id]
     @intakes=Intake.find_all_by_commodity_id(commodity_id)
     @outflows=Outflow.find_all_by_commodity_id(commodity_id)
     if request.post?

      @start=params[:report][:start_date].to_date unless params[:report][:start_date]==""
      @end=params[:report][:end_date].to_date unless params[:report][:end_date]==""
      if !@start.present? and !@end.present?
         @intakes=Intake.find_all_by_commodity_id(commodity_id)
         @outflows=Outflow.find_all_by_commodity_id(commodity_id)
      else if @start.present? and !@end.present?
          @intakes=Intake.find_all_by_commodity_id(commodity_id).reject{|i| !(i.created_at.to_date >= @start)}
          @outflows=Outflow.find_all_by_commodity_id(commodity_id).reject{|i| !(i.created_at.to_date >= @start)}
      else if  !@start.present? and @end.present?
          @intakes=Intake.find_all_by_commodity_id(commodity_id).reject{|i| !(i.created_at.to_date <= @end)}
       @outflows=Outflow.find_all_by_commodity_id(commodity_id).reject{|i| !(i.created_at.to_date <= @end)}
      else
      @intakes=Intake.find_all_by_commodity_id(commodity_id).reject{|i| !(i.created_at.to_date >= @start and i.created_at.to_date <= @end)}
       @outflows=Outflow.find_all_by_commodity_id(commodity_id).reject{|i| !(i.created_at.to_date >= @start and i.created_at.to_date <= @end)}
     end
      end
      end


     end
   end
end
