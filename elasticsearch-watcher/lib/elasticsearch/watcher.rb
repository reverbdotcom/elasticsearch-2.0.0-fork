require "elasticsearch/watcher/version"

Dir[ File.expand_path('../watcher/api/actions/**/*.rb', __FILE__) ].each   { |f| require f }

module Elasticsearch2
  module Watcher
    def self.included(base)
      base.__send__ :include, Elasticsearch2::API::Watcher
    end
  end
end

module Elasticsearch2
  module API
    module Watcher
      module Actions; end

        # Client for the "watcher" namespace (includes the {Watcher::Actions} methods)
        #
        class WatcherClient
          include Elasticsearch2::API::Common::Client,
                  Elasticsearch2::API::Common::Client::Base,
                  Elasticsearch2::API::Watcher::Actions
        end

        # Proxy method for {WatcherClient}, available in the receiving object
        #
        def watcher
          @watcher ||= WatcherClient.new(self)
        end
    end
  end
end

Elasticsearch2::API.__send__ :include, Elasticsearch2::API::Watcher

Elasticsearch2::Transport::Client.__send__ :include, Elasticsearch2::API::Watcher if defined?(Elasticsearch2::Transport::Client)
