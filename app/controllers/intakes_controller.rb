class IntakesController < ApplicationController
  def intake
    @commodity=Commodity.find(params[:commodity_id])
    @intake=@commodity.intakes.build
  end
  def create
    if current_user.type=="Master"
      @commodity=Commodity.find(params[:commodity_id])
      @intake=@commodity.intakes.build(params[:intake])
      @intake.user_id=current_user.id
      if @intake.save
        redirect_to:controller=>"commodities",:action=>"index", :category_id=>@commodity.category_id
        flash[:notice]="Add Successfully"
      else
        render:intake
    end
    end
  end

end
