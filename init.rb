class ActiveRecord::Base

  def self.named_scope_for attribute
    named_scope "for_#{attribute}",
      lambda { |attribute_value| { :conditions => { attribute => attribute_value } } }
  end

  named_scope :order_by, Proc.new { |*attributes|
    raise ArgumentError, 'You must specify an attribute to order by' if attributes.blank?
    { :order => attributes.join(', ') }
  }

end
