manyou_config = "#{RAILS_ROOT}/config/manyou.yml"
 
require 'rmanyou'
require "rmanyou/rails/controller"
require "rmanyou/session"
 
 
if File.exist?(manyou_config)
  MANYOU = YAML.load_file(manyou_config)[RAILS_ENV]
  ENV['MANYOU_API_KEY'] = MANYOU['api_key']
  ENV['MANYOU_SECRET_KEY'] = MANYOU['secret_key']
  ENV['MANYOU_RELATIVE_URL_ROOT'] = MANYOU['canvas_page_name']
  ActionController::Base.asset_host = MANYOU['callback_url']
end
 
ActionController::Base.send(:include,Rmanyou::Rails::Controller) 