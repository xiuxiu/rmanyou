module Rmanyou
  class Model
    def has_attr?(attr)
      self.attr_names.includes?(attr.to_sym)
    end
    def self.is_array?
      false
    end
  end
end