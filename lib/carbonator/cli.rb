require 'optparse'

module Carbonator
  class CLI
    attr_reader :parser

    def initialize
      @parser = Parser.new
    end

    def run
      ARGV.options do |o|
        opts = {}
        o.banner = 'Usage: carbonator [OPTIONS]'
	o.set_summary_indent("  ")
	o.on('-p', '--prefix PREFIX', String, 'path to prefix metrics with') { |p| opts[:prefix] = p }
        o.parse!

        ARGF.each_line do |l|
          data = KV.parse(l)
          parser.parse(data, opts).each { |x| puts x } 
        end
      end
    end
  end
end
