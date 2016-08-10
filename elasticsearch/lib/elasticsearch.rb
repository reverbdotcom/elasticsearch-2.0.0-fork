require "elasticsearch/version"

require 'elasticsearch/transport'
require 'elasticsearch/api'

module Elasticsearch2
  module Transport
    class Client
      include Elasticsearch2::API
    end
  end
end
