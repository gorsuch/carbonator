require 'spec_helper'

describe Carbinator::Parser do
  let(:simple_data) { {'metricname' => 'foo', 'value' => 1 } }
  let(:parser) { Carbinator::Parser.new }

  describe '#parse' do
    it 'it should return an array' do
      parser.parse(simple_data).should be_kind_of(Array) 
    end

    it 'should handle a simple dataset' do
      parser.parse(simple_data).should eq(["foo 1"])
    end
  end
end
