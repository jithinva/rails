class OutflowsController < ApplicationController
  def outflow
    @commodity=Commodity.find(params[:commodity_id])
    @outflow=@commodity.outflows.build
  end
  def create
      @commodity=Commodity.find(params[:commodity_id])
      @outflow=@commodity.outflows.build(params[:outflow])
      @intake=Intake.find_all_by_commodity_id(@commodity.id).sum(&:intake_amt).to_f
      @outfl=Outflow.find_all_by_commodity_id(@commodity.id).sum(&:outflow_amt).to_f
      @out_amt=params[:outflow][:outflow_amt].to_f
      @out=@outfl+@out_amt
      @out.to_f
      @outflow.user_id=current_user.id
      if @intake > @out
      if @outflow.save
        redirect_to:controller=>"commodities",:action=>"index", :category_id=>@commodity.category_id
        flash[:notice]="Drew Successfully"
      else
        render:outflow
      end
      else
       redirect_to:controller=>"commodities",:action=>"index", :category_id=>@commodity.category_id
       flash[:notice]="NO balance"
      end
  end

end
