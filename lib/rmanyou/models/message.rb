require "rmanyou/model"
 
module Rmanyou
  class Message < Model
    
    def self.elm_name
      "message"
    end
    
    def self.attr_names
      [
       :unread,
       :most_recent
      ]
    end
 
    for a in attr_names
      attr_accessor a
    end
    
  end
end