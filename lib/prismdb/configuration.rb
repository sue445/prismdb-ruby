module Prisbdb
  class Configuration
    # @!attribute debug_logger
    #   @return [Logger]
    attr_accessor :debug_logger

    # @!attribute api_endpoint
    #   @return [String]
    attr_accessor :api_endpoint

    def initialize
      @api_endpoint = "https://prismdb.takanakahiko.me"
    end
  end
end
