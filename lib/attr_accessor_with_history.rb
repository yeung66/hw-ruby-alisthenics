class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      # YOUR CODE HERE
      def #{attr_name}=(new_value)
        @#{attr_name}_history ||= []
        @#{attr_name}_history <<= @#{attr_name}
        @#{attr_name} = new_value
      end
    }
  end
end

class A
  def initialize(bar)
    @bar = bar
  end
  
  attr_accessor :bar
  attr_accessor_with_history(:bar)
end

a = A.new(1)
a.bar = 123
a.bar = 23
puts a.bar_history.inspect