module Prismdb
  class Configuration
    # @!attribute api_endpoint
    #   @return [String]
    attr_accessor :api_endpoint

    def initialize
      @api_endpoint = "https://prismdb.takanakahiko.me"
    end
  end
end
