require 'rmanyou'
module Rmanyou
  module Rails
    module Controller
      def self.included(controller)
        controller.extend(ClassMethods)
      end
      
      attr_reader :manyou_session
      
      def set_manyou_session
        if @manyou_session.nil?
          @manyou_session = Session.new(params)
          if @manyou_session.in_iframe
            session[:manyou_session] = @manyou_session
          end
          if @manyou_session.session_key.nil?
            @manyou_session = session[:manyou_session]
          end
        end
        @manyou_session
      end
      def require_login
        set_manyou_session
        app_id =@manyou_session.app_Id
        if (@manyou_session.user.nil?)
          render :text => "<my:redirect to=\"require_login\" appId=\"#{app_id}\"/>";
        end
      end
      def require_install
        set_manyou_session
        app_id =@manyou_session.app_Id
        if (!@manyou_session.added)
          render :text => "<my:redirect to=\"require_add\" appId=\"#{app_id}\"/>";
        end        
      end
      module ClassMethods
        def require_login
          before_filter :require_login
        end
        def require_install
          before_filter :require_install
        end
      end
    end
  end
end