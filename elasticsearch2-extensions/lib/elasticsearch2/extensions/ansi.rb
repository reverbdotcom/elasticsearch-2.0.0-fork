# encoding: utf-8

require 'elasticsearch2/extensions'

require 'ansi'
require 'ansi/table'
require 'ansi/terminal'

require 'delegate'
require 'elasticsearch2/transport/transport/response'

require 'elasticsearch2/extensions/ansi/helpers'
require 'elasticsearch2/extensions/ansi/actions'
require 'elasticsearch2/extensions/ansi/response'

module Elasticsearch2
  module Extensions

    # This extension provides a {ResponseBody#to_ansi} method for the Elasticsearch2 response body,
    # which colorizes and formats the output with the `ansi` gem.
    #
    # @example Display formatted search results
    #
    #     require 'elasticsearch2/extensions/ansi'
    #     puts Elasticsearch2::Client.new.search.to_ansi
    #
    # @example Display a table with the output of the `_analyze` API
    #
    #     require 'elasticsearch2/extensions/ansi'
    #     puts Elasticsearch2::Client.new.indices.analyze(text: 'Quick Brown Fox Jumped').to_ansi
    #
    module ANSI
    end

  end
end
