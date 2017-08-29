module Elasticsearch2
  module API
    module Watcher
      module Actions

        # Restart the watcher service
        #
        #
        # @see http://www.elastic.co/guide/en/watcher/current/appendix-api-service.html
        #
        def restart(arguments={})
          valid_params = [
             ]
          method = 'PUT'
          path   = "/_watcher/_restart"
          params = {}
          body   = nil

          perform_request(method, path, params, body).body
        end
      end
    end
  end
end
