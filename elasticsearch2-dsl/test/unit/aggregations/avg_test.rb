require 'test_helper'

module Elasticsearch2
  module Test
    module Aggregations
      class AvgTest < ::Test::Unit::TestCase
        include Elasticsearch2::DSL::Search::Aggregations

        context "Avg agg" do
          subject { Avg.new }

          should "be converted to a Hash" do
            assert_equal({ avg: {} }, subject.to_hash)
          end

          should "take a Hash" do
            subject = Avg.new foo: 'bar'
            assert_equal({ avg: { foo: 'bar' } }, subject.to_hash)
          end
        end
      end
    end
  end
end
