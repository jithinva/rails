class Intake < ActiveRecord::Base
  belongs_to :user
  belongs_to :commodity
  belongs_to :category
  validates_numericality_of :intake_amt, :only_integer => true,:message=>"should be integer "
  	def self.total_on(date,commodity)
	Intake.all.reject{|i| !( i.created_at.to_date ==date && i.commodity_id==commodity)}.sum(&:intake_amt)
	end
end
