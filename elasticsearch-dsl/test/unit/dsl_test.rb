require 'test_helper'

module Elasticsearch2
  module Test
    class DSLTest < ::Test::Unit::TestCase
      context "The DSL" do
        class DummyDSLReceiver
          include Elasticsearch2::DSL
        end

        should "include the module in receiver" do
          assert_contains DummyDSLReceiver.included_modules, Elasticsearch2::DSL
          assert_contains DummyDSLReceiver.included_modules, Elasticsearch2::DSL::Search
        end
      end
    end
  end
end
