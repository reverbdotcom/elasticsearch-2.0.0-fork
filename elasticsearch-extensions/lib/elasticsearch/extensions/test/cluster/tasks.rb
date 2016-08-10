require 'elasticsearch/extensions/test/cluster'

namespace :elasticsearch do
  desc "Start Elasticsearch2 cluster for tests"
  task :start do
    Elasticsearch2::Extensions::Test::Cluster.start
  end

  desc "Stop Elasticsearch2 cluster for tests"
  task :stop do
    Elasticsearch2::Extensions::Test::Cluster.stop
  end
end
