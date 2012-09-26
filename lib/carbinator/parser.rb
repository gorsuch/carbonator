module Carbinator
  class Parser
    def metricname(data, opts)
      name = data['metricname']
      prefix = opts[:prefix]
      prefix ? "#{prefix}.#{name}" : name
    end

    def parse(data, opts={})
      ["#{metricname(data, opts)} #{data['value']}"]
    end
  end
end
