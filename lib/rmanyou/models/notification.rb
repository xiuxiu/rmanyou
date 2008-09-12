require "rmanyou/model"
 
module Rmanyou
  class Notification < Model
    
    def self.elm_name
      "notification"
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