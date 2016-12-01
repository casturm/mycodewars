module AttrLazy
  def attr_lazy(name, &block)
    variable_name = "@#{name.to_s.tr('?', '')}"
    self.send(:define_method, name) do 
      unless self.instance_variables.include?(variable_name.to_sym)
        self.instance_variable_set(variable_name, instance_eval(&block))
      end
      self.instance_variable_get(variable_name)
    end
  end
end

class Numbers
  extend AttrLazy

  def initialize(*numbers)
    @numbers = numbers
  end

  attr_lazy :even? do
    @numbers.all?(&:even?)
  end

  def mark_even
    @even = true
  end
end
