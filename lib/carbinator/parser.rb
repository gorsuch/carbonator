module Carbinator
  class Parser
    def parse(data)
      ["#{data['metricname']} #{data['value']}"]
    end
  end
end
