module Carbinator
  class CLI
    attr_reader :parser

    def initialize
      @parser = Parser.new
    end

    def run
      ARGF.each_line do |l|
        data = KV.parse(l)
        parser.parse(data).each { |x| puts x } 
      end
    end
  end
end
