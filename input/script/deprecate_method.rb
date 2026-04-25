class Module
  def deprecate(method_name)
    module_eval <<-END, __FILE__, __LINE__ + 1
        alias_method :deprecated_#{method_name}, :#{method_name}
        def #{method_name}(*args, &block)
          $stderr.puts "Warning: #{self}##{method_name} deprecate"
          deprecated_#{method_name}(*args, &block)
        end
    END
  end
end

class MyClass
  def mymethod; end
  deprecate :mymethod
end

MyClass.new.mymethod
