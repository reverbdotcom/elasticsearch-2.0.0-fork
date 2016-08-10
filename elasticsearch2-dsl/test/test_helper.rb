JRUBY = defined?(JRUBY_VERSION)

if ENV['COVERAGE'] || ENV['CI']
  require 'simplecov'
  SimpleCov.start { add_filter "/test|test_" }
end

at_exit { Elasticsearch2::Test::IntegrationTestCase.__run_at_exit_hooks }

require 'test/unit'
require 'shoulda-context'
require 'mocha/setup'

require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require 'elasticsearch2'
require 'elasticsearch2/extensions/test/cluster'
require 'elasticsearch2/extensions/test/startup_shutdown'

require 'elasticsearch2/dsl'

module Elasticsearch2
  module Test
    class IntegrationTestCase < ::Test::Unit::TestCase
      include Elasticsearch2::Extensions::Test
      extend  StartupShutdown

      startup do
        Cluster.start(nodes: 1) if ENV['SERVER'] \
                                && ! Elasticsearch2::Extensions::Test::Cluster.running?
      end

      shutdown do
        Cluster.stop if ENV['SERVER'] \
                     && started?      \
                     && Elasticsearch2::Extensions::Test::Cluster.running?
      end

      def setup
        @port = (ENV['TEST_CLUSTER_PORT'] || 9250).to_i

        @logger =  Logger.new(STDERR)
        @logger.formatter = proc do |severity, datetime, progname, msg|
          color = case severity
            when /INFO/ then :green
            when /ERROR|WARN|FATAL/ then :red
            when /DEBUG/ then :cyan
            else :white
          end
          ANSI.ansi(severity[0] + ' ', color, :faint) + ANSI.ansi(msg, :white, :faint) + "\n"
        end

        @client = Elasticsearch2::Client.new host: "localhost:#{@port}", logger: @logger
      end

      def teardown
        @client.indices.delete index: '_all'
      end
    end
  end
end
