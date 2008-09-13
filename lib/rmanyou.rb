$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rmanyou/models/friend'
require 'rmanyou/models/user'
require 'rmanyou/models/message'
require 'rmanyou/models/notification'
require 'rmanyou/models/friend_request'
require 'rmanyou/models/error'
require 'rmanyou/models/arg'

module Rmanyou
  
end