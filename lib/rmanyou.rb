$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rmanyou/models/friend'
require 'rmanyou/models/error'

module Rmanyou
  
end