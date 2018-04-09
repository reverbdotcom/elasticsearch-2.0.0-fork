# encoding: UTF-8

require 'test_helper'

module Elasticsearch2
  module Test
    class APITest < ::Test::Unit::TestCase

      context "The API module" do

        should "access the settings" do
          assert_not_nil Elasticsearch2::API.settings
        end

        should "allow to set settings" do
          assert_nothing_raised { Elasticsearch2::API.settings[:foo] = 'bar' }
          assert_equal 'bar', Elasticsearch2::API.settings[:foo]
        end

        should "have default serializer" do
          assert_equal MultiJson, Elasticsearch2::API.serializer
        end

      end

    end
  end
end
