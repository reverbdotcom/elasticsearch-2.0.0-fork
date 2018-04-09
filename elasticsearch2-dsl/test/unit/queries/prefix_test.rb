require 'test_helper'

module Elasticsearch2
  module Test
    module Queries
      class PrefixTest < ::Test::Unit::TestCase
        include Elasticsearch2::DSL::Search::Queries

        context "Prefix query" do
          subject { Prefix.new }

          should "be converted to a Hash" do
            assert_equal({ prefix: {} }, subject.to_hash)
          end
                          
          should "have option methods" do
            subject = Prefix.new :foo
            
            subject.value 'bar'
            subject.boost 'bar'
          
            assert_equal %w[ boost value ],
                         subject.to_hash[:prefix][:foo].keys.map(&:to_s).sort
            assert_equal 'bar', subject.to_hash[:prefix][:foo][:value]
          end
          
          should "take a block" do
            subject = Prefix.new :foo do
              value 'bar'
            end
            assert_equal({prefix: { foo: { value: 'bar' } }}, subject.to_hash)
          end
        end
      end
    end
  end
end
