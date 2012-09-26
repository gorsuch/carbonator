require 'spec_helper'

describe Carbonator::Parser do
  let(:data) { {'host' => 'foo', 'http_code' => 200, 'connect_time' => 0.2} }
  let(:parser) { Carbonator::Parser.new }

  describe '#parse' do
    it 'it should return an array' do
      parser.parse(data).should be_kind_of(Array) 
    end

    it 'should handle a simple dataset' do
      Timecop.freeze(Time.now) do
        expected = ["foo.http_code 200 #{Time.now.to_i}", "foo.connect_time 0.2 #{Time.now.to_i}"]
        parser.parse(data).should eq(expected)
      end
    end

    it 'should prefix the data if asked' do
      Timecop.freeze(Time.now) do
        expected = ["test.foo.http_code 200 #{Time.now.to_i}", "test.foo.connect_time 0.2 #{Time.now.to_i}"]
        parser.parse(data, :prefix => 'test').should eq(expected)
      end
    end

    it 'should use a different base name if asked' do
      Timecop.freeze(Time.now) do
        expected = ["other.http_code 200 #{Time.now.to_i}", "other.connect_time 0.2 #{Time.now.to_i}"]
        parser.parse(data.merge('alt' => 'other'), :host_key => 'alt').should eq(expected)
      end
    end

    it 'substitutes a default base if one is not provided' do
      Timecop.freeze(Time.now) do
        expected = ["carbinator.http_code 200 #{Time.now.to_i}"]
        parser.parse({'http_code' => 200}).should eq(expected)
      end
    end
  end
end
