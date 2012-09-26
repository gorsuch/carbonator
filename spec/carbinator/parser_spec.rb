require 'spec_helper'

describe Carbinator::Parser do
  let(:data) { {'base' => 'foo', 'http_code' => 200, 'connect_time' => 0.2} }
  let(:parser) { Carbinator::Parser.new }

  describe '#parse' do
    it 'it should return an array' do
      parser.parse(data).should be_kind_of(Array) 
    end

    it 'should handle a simple dataset' do
      parser.parse(data).should eq(['foo.http_code 200', 'foo.connect_time 0.2'])
    end

    it 'should prefix the data if asked' do
      parser.parse(data, :prefix => 'test').should eq(['test.foo.http_code 200', 'test.foo.connect_time 0.2'])
    end

    it 'should use a different base name if asked' do
      expected = ['other.http_code 200', 'other.connect_time 0.2']
      parser.parse(data.merge('alt' => 'other'), :base_key => 'alt').should eq(expected)
    end
  end
end
