class User < ActiveRecord::Base
  has_many:intakes
  has_many:outflows
  def self.inherited(child)
  child.instance_eval do
    def model_name
      User.model_name
    end
  end
  super
end

  acts_as_authentic
end
