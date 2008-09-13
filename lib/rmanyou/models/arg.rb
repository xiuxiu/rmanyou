require "rmanyou/model"
 
module Rmanyou
  class Arg < Model
    
    def self.elm_name
      "arg"
    end
    
    def self.attr_names
      [
       :key,
       :value
      ]
    end
 
    for a in attr_names
      attr_accessor a
    end
    
  end
end