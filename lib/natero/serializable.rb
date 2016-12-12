module Serializable
  @@serializer = JSON

  def serialize
    obj = {}
    instance_variables.map do |var|
      iv = instance_variable_get(var)
      obj[var.to_s.gsub('@', '')] = iv unless iv.nil?
    end

    @@serializer.dump obj
  end

  def unserialize(string)
    obj = @@serializer.parse(string)
    obj.keys.each do |key|
      instance_variable_set(key, obj[key])
    end
  end

  def to_h
    @@serializer.parse serialize
  end
end