require 'test_helper'

module Elasticsearch2
  module Test
    module Filters
      class PrefixTest < ::Test::Unit::TestCase
        include Elasticsearch2::DSL::Search::Filters

        context "Prefix filter" do
          subject { Prefix.new }

          should "be converted to a Hash" do
            assert_equal({ prefix: {} }, subject.to_hash)
          end

          should "take a Hash" do
            subject = Prefix.new foo: 'bar'

            assert_equal({ prefix: { foo: 'bar' } }, subject.to_hash)
          end
        end
      end
    end
  end
end
