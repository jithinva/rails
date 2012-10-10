class Outflow < ActiveRecord::Base
  belongs_to :user
  belongs_to :commodity
  validates_numericality_of :outflow_amt, :only_integer => true,:message=>"should be integer "
	def self.total_on(date,commodity)
	Outflow.all.reject{|i| !( i.created_at.to_date ==date && i.commodity_id==commodity)}.sum(&:outflow_amt)
	end
end
