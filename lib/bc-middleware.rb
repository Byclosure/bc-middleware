require "bc-middleware/version"

module BcMiddleware
  autoload :SearchApi, 'bc-middleware/search_api'
end

class ActionController::Base
  def self.bc_middleware(options={})
    inherited_resources
    include BcMiddleware::SearchApi
  end
end