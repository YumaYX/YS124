data = { name: "Alice", age: 25, city: "Tokyo" }

def create_dynamic_class(hash)
  Class.new do
    hash.each_key do |key|
      attr_accessor key.to_sym
    end

    define_method(:initialize) do
      hash.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end

kls = create_dynamic_class(data)
obj = kls.new

obj
obj.name
obj.age
obj.city
