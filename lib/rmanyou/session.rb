module Rmanyou
  class Session
    attr_accessor :auth_token
    attr_reader :session_key
    attr_reader :user
    attr_reader :site
    attr_reader :time
    attr_reader :key
    attr_reader :friends
    attr_reader :prefix
    attr_reader :app_Id
    attr_reader :in_iframe
    attr_reader :added
    
    def initialize(params)
      if params["my_sig_sessionId"]
        @user = params["my_sig_uId"]
        @site = params["my_sig_sId"]
        @time = params["my_sig_time"]
        @session_key = params["my_sig_sessionId"]
        @friends = params["my_sig_friends"]
        @added = params["my_sig_added"] == "1"
        @prefix = params["my_sig_prefix"]
        @app_Id = params["my_sig_appId"]
        @in_iframe = params["xn_sig_in_canvas"] == "0"
        @key = params["my_sig_key"]
      end
    end
    
    def api_key
      ENV['MANYOU_API_KEY']
    end
    
    def invoke_method(method, params = {})
      my_params = { 
        :method => method,
        :api_key => api_key,
        :session_key => session_key,
        :format => "XML",
        :v => "0.1"
      }      

      tmp_params = { }
      my_params.each { |k,v| tmp_params[k.to_s] = v }
      my_params = tmp_params
      str = (my_params.sort.collect { |c| "#{c[0]}=#{c[1]}&" }).join("") 
      if (params)
        args_params = { }
        params.each { |k,v| args_params["args[#{k.to_s}]"] = v }
        str += (args_params.sort.collect { |c| "#{c[0]}=#{c[1]}&" }).join("")         
      end
      str +=ENV['MANYOU_SECRET_KEY']

      #pp("str = #{str}") if DEBUG

      sig = Digest::MD5.hexdigest(str)
      
      my_params["sig"] = sig
      my_params.merge!(args_params) if params
      #pp("manyou_params = #{my_params.inspect}") if DEBUG

      Parse.new.process(Service.new.post(my_params).body)
    end
  end
end