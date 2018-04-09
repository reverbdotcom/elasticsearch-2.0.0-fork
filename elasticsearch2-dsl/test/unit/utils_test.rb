require 'test_helper'

module Elasticsearch2
  module Test
    class UtilsTest < ::Test::Unit::TestCase
      context "Utils" do
        should "convert a string to camelcase" do
          assert_equal 'Foo', Elasticsearch2::DSL::Utils.__camelize('foo')
        end

        should "convert an underscored string to camelcase" do
          assert_equal 'FooBar', Elasticsearch2::DSL::Utils.__camelize('foo_bar')
        end

        should "convert a symbol" do
          assert_equal 'FooBar', Elasticsearch2::DSL::Utils.__camelize(:foo_bar)
        end
      end
    end
  end
end
