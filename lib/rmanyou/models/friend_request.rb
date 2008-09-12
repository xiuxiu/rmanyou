require "rmanyou/model"
 
module Rmanyou
  class FriendRequest < Model
    
    def self.elm_name
      "friend_request"
    end
    
    def self.attr_names
      [
       :uids
      ]
    end
 
    for a in attr_names
      attr_accessor a
    end
    
  end
end