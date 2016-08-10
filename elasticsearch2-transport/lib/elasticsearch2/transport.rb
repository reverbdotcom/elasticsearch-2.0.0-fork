require "uri"
require "time"
require "timeout"
require "multi_json"
require "faraday"

require "elasticsearch2/transport/transport/serializer/multi_json"
require "elasticsearch2/transport/transport/sniffer"
require "elasticsearch2/transport/transport/response"
require "elasticsearch2/transport/transport/errors"
require "elasticsearch2/transport/transport/base"
require "elasticsearch2/transport/transport/connections/selector"
require "elasticsearch2/transport/transport/connections/connection"
require "elasticsearch2/transport/transport/connections/collection"
require "elasticsearch2/transport/transport/http/faraday"
require "elasticsearch2/transport/client"

require "elasticsearch2/transport/version"

module Elasticsearch2
  module Client

    # A convenience wrapper for {::Elasticsearch2::Transport::Client#initialize}.
    #
    def new(arguments={}, &block)
      Elasticsearch2::Transport::Client.new(arguments, &block)
    end
    extend self
  end
end
