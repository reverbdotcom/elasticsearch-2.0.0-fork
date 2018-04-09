require "elasticsearch2/version"

require 'elasticsearch2/transport'
require 'elasticsearch2/api'

module Elasticsearch2
  module Transport
    class Client
      include Elasticsearch2::API
    end
  end
end
