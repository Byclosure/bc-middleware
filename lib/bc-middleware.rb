require "bc-middleware/version"
require "inherited_resources"

module BcMiddleware
  autoload :SearchApi, 'bc-middleware/search_api'
end

class ActionController::Base
  def self.bc_middleware(options={})
    inherit_resources
    include BcMiddleware::SearchApi
  end
end