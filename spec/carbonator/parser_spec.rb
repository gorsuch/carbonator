require 'spec_helper'

describe Carbonator::Parser do
  let(:data) { {'host' => 'foo', 'measure' => 'foo.http_code', 'value' => 200} }
  let(:parser) { Carbonator::Parser.new }
  let(:prefixed_parser) { Carbonator::Parser.new(:prefix => 'test') }

  describe '#parse' do
    it 'it should return a string' do
      parser.parse(data).should be_kind_of(String) 
    end

    it 'should handle a simple dataset' do
      Timecop.freeze(Time.now) do
        expected = "carbonator.foo.http_code 200 #{Time.now.to_i}"
        parser.parse(data).should eq(expected)
      end
    end

    it 'should prefix the data if asked' do
      Timecop.freeze(Time.now) do
        expected = "test.foo.http_code 200 #{Time.now.to_i}"
        prefixed_parser.parse(data).should eq(expected)
      end
    end
  end
end
