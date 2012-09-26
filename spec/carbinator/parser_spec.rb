require 'spec_helper'

describe Carbinator::Parser do
  let(:simple_data) { {'metricname' => 'foo', 'value' => 1 } }
  let(:complex_data) { {'metricname' => 'foo', 'http_response' => 1, 'connect_time' => 0.2 } }
  let(:parser) { Carbinator::Parser.new }

  describe '#parse' do
    it 'it should return an array' do
      parser.parse(simple_data).should be_kind_of(Array) 
    end

    it 'should handle a simple dataset' do
      parser.parse(simple_data).should eq(["foo 1"])
    end

    it 'should prefix the data if asked' do
      parser.parse(simple_data, :prefix => 'test').should eq(["test.foo 1"])
    end

    it 'should use a different value as the metric name if asked' do
      parser.parse(simple_data.merge('alt' => 'other'), :metricname_key => 'alt').should eq(['other 1'])
    end

    it 'should handle complex data' do
      expected = ['foo.http_response 1', 'foo.connect_time 0.2']
      parser.parse(complex_data).should eq(expected)
    end
  end
end
