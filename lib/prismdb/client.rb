module Prismdb
  class Client
    # @return [Array<Prismdb::Response>]
    def characters
      with_error_handling do
        connection.get("/api/character").body["results"]
      end
    end

    # @param key [String]
    #
    # @return [Prismdb::Response]
    def character(key)
      with_error_handling do
        connection.get("/api/character/#{key}").body
      end
    end

    # @return [Array<Prismdb::Response>]
    def episodes
      with_error_handling do
        connection.get("/api/episode").body["results"]
      end
    end

    # @param key [String]
    #
    # @return [Prismdb::Response]
    def episode(key)
      with_error_handling do
        connection.get("/api/episode/#{key}").body
      end
    end

    # @return [Array<Prismdb::Response>]
    def songs
      with_error_handling do
        connection.get("/api/song").body["results"]
      end
    end

    private

    # @return [Faraday::Connection]
    def connection
      Faraday.new(url: Prismdb.config.api_endpoint) do |conn|
        conn.request :json
        conn.response :mashify, mash_class: Prismdb::Response
        conn.response :json
        conn.response :raise_error

        conn.adapter Faraday.default_adapter
      end
    end

    def with_error_handling
      yield
    rescue Faraday::ClientError, Faraday::ServerError => _error
      raise Prismdb::Error
    end
  end
end
