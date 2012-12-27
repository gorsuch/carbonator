require 'optparse'

module Carbonator
  class CLI
    attr_accessor :parser

    def run
      ARGV.options do |o|
        opts = {}
        o.banner = 'Usage: carbonator [OPTIONS]'
	o.set_summary_indent("  ")
	o.on('-p', '--prefix PREFIX', String, 'path to prefix metrics with') { |p| opts[:prefix] = p }
        o.parse!
        parser = Parser.new(opts) 
        
        ARGF.each_line do |l|
          data = KV.parse(l)
          result = parser.parse(data)
          puts result if result 
        end
      end
    end
  end
end
