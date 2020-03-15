module Prismdb
  class Client
    # @return [Array<Prismdb::Response>]
    def get_characters
      with_error_handling do
        connection.get("/api/character").body["results"]
      end
    end

    # @param key [String]
    #
    # @return [Prismdb::Response]
    def find_character(key)
      with_error_handling do
        connection.get("/api/character/#{key}").body
      end
    end

    # @return [Array<Prismdb::Response>]
    def get_episodes
      with_error_handling do
        connection.get("/api/episode").body["results"]
      end
    end

    # @param key [String]
    #
    # @return [Prismdb::Response]
    def find_episode(key)
      with_error_handling do
        connection.get("/api/episode/#{key}").body
      end
    end

    # @return [Array<Prismdb::Response>]
    def get_songs
      with_error_handling do
        connection.get("/api/song").body["results"]
      end
    end

    # @param key [String]
    #
    # @return [Prismdb::Response]
    def find_song(key)
      with_error_handling do
        connection.get("/api/song/#{key}").body
      end
    end

    # @return [Array<Prismdb::Response>]
    def get_lives
      with_error_handling do
        connection.get("/api/live").body["results"]
      end
    end

    # @param key [String]
    #
    # @return [Prismdb::Response]
    def find_live(key)
      with_error_handling do
        connection.get("/api/live/#{key}").body
      end
    end

    # @return [Array<Prismdb::Response>]
    def get_series
      with_error_handling do
        connection.get("/api/series").body["results"]
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
