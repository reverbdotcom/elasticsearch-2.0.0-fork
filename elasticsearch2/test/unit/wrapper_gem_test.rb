require 'test_helper'

module Elasticsearch2
  module Test
    class WrapperGemTest < ::Test::Unit::TestCase

      context "Wrapper gem" do

        should "require all neccessary subgems" do
          assert defined? Elasticsearch2::Client
          assert defined? Elasticsearch2::API
        end

        should "mix the API into the client" do
          client = Elasticsearch2::Client.new

          assert_respond_to client, :search
          assert_respond_to client, :cluster
          assert_respond_to client, :indices
        end

      end

    end
  end
end
