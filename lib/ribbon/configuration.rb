module Ribbon
  class Configuration
    attr_accessor :api_key

    def [](option)
      send(option)
    end
  end
end
