module Carbinator
  class Parser
    def metricname(data, opts)
      metricname_key = opts[:metricname_key] || 'metricname'
      name = data[metricname_key]
      prefix = opts[:prefix]
      prefix ? "#{prefix}.#{name}" : name
    end

    def parse(data, opts={})
      ["#{metricname(data, opts)} #{data['value']}"]
    end
  end
end
