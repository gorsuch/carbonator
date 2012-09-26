module Carbonator
  class Parser
    def metricname(data, k, opts)
      host_key = opts[:host_key] || 'host'
      host = data[host_key] || 'carbinator'

      name = [host, k].join('.')

      prefix = opts[:prefix]
      prefix ? "#{prefix}.#{name}" : name
    end

    def filter_numeric(data)
      data.select { |k,v| v.kind_of?(Numeric) }
    end

    def parse(data, opts={})
      filter_numeric(data).map do |k,v|
        "#{metricname(data, k, opts)} #{v} #{Time.now.to_i}"              
      end
    end
  end
end
