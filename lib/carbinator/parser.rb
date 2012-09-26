module Carbinator
  class Parser
    def metricname(data, k, opts)
      base_key = opts[:base_key] || 'base'
      base = data[base_key] || 'carbinator'

      name = [base, k].join('.')

      prefix = opts[:prefix]
      prefix ? "#{prefix}.#{name}" : name
    end

    def filter_numeric(data)
      data.select { |k,v| v.kind_of?(Numeric) }
    end

    def parse(data, opts={})
      base_key = opts[:base_key] || 'base'
      base = data[base_key]
      
      filter_numeric(data).map do |k,v|
        "#{metricname(data, k, opts)} #{v}"              
      end
    end
  end
end
