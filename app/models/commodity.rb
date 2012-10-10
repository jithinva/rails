class Commodity < ActiveRecord::Base
  belongs_to :category
  has_many :intakes,:dependent=>:destroy
  has_many :outflows,:dependent=>:destroy
  validates_presence_of:commodity,:description
  def stock(commodity_id)
    @intake=Intake.find_all_by_commodity_id(commodity_id).sum(&:intake_amt).to_f
    @outflow=Outflow.find_all_by_commodity_id(commodity_id).sum(&:outflow_amt).to_f
    @stock=@intake-@outflow
    return @stock
  end
end
