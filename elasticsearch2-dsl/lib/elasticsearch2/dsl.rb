require 'elasticsearch2/dsl/version'

require 'elasticsearch2/dsl/utils'
require 'elasticsearch2/dsl/search/base_component'
require 'elasticsearch2/dsl/search/base_compound_filter_component'
require 'elasticsearch2/dsl/search/base_aggregation_component'
require 'elasticsearch2/dsl/search/query'
require 'elasticsearch2/dsl/search/filter'
require 'elasticsearch2/dsl/search/aggregation'
require 'elasticsearch2/dsl/search/highlight'
require 'elasticsearch2/dsl/search/sort'
require 'elasticsearch2/dsl/search/options'
require 'elasticsearch2/dsl/search/suggest'

Dir[ File.expand_path('../dsl/search/queries/**/*.rb', __FILE__) ].each        { |f| require f }
Dir[ File.expand_path('../dsl/search/filters/**/*.rb', __FILE__) ].each        { |f| require f }
Dir[ File.expand_path('../dsl/search/aggregations/**/*.rb', __FILE__) ].each   { |f| require f }

require 'elasticsearch2/dsl/search'

module Elasticsearch2

  # The main module, which can be included into your own class or namespace,
  # to provide the DSL methods.
  #
  # @example
  #
  #     include Elasticsearch2::DSL
  #
  #     definition = search do
  #       query do
  #         match title: 'test'
  #       end
  #     end
  #
  #     definition.to_hash
  #     # => { query: { match: { title: "test"} } }
  #
  # @see Search
  # @see http://www.elasticsearch.org/guide/en/elasticsearch/guide/current/query-dsl-intro.html
  #
  module DSL
    def self.included(base)
      base.__send__ :include, Elasticsearch2::DSL::Search
    end
  end
end
