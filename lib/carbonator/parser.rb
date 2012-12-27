module Carbonator
  class Parser
    attr_accessor :prefix

    def initialize(opts={})
      self.prefix = opts[:prefix] || 'carbonator'
    end

    def metric(data)
      prefix ? "#{prefix}.#{data['measure']}" : data['measure']
    end

    def parse(data)
      return nil unless measurement?(data)
      metric = metric(data)
      value       = value(data)
      timestamp   = timestamp(data)
      "#{metric} #{value} #{timestamp}"
    end

    def timestamp(data)
      data['timestamp'] || Time.now.to_i  
    end

    def measurement?(data)
      data.has_key?('measure') && data.has_key?('value')
    end

    def value(data)
      data['value']
    end
  end
end
