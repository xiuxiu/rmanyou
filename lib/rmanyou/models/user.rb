require "rmanyou/model"
module Rmanyou
  class User < Model
    def self.elm_name
      "user"
    end
    
    def self.attr_names
      [ :uid,
        :uch_id ,
        :name,
        :handle,
        :site,
        :sex,        
        :birthday,
        :blood_type,
        :relationship_status,
        :current_location,
        :hometown_location,
        :has_added_app,
        :admin_level,
        :pic,
        :pic_thumb,
        :pic_small
      ]
    end
    
    for a in attr_names
      attr_accessor a
    end
    
  end
end
