class ActiveRecord::Base

  def self.named_scope_for attribute
    named_scope "for_#{attribute}",
      lambda { |attribute_value| { :conditions => { attribute => attribute_value } } }
  end

  named_scope :by, Proc.new { |attribute, desc|
    raise ArgumentError, 'An attribute to order by must be specified' unless attribute
    { :order => "#{attribute}#{ desc && :asc != desc ? ' DESC' : '' }" }
  }

end
