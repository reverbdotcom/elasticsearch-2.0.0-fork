require 'test_helper'

module Elasticsearch2
  module Test
    class WatcherStopTest < ::Test::Unit::TestCase

      context "Watcher: Stop" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'PUT', method
            assert_equal "/_watcher/_stop", url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.watcher.stop
        end

      end

    end
  end
end
