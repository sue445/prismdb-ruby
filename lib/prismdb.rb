require "prismdb/version"
require "faraday"

module Prismdb
  autoload :Client,        "prismdb/client"
  autoload :Configuration, "prismdb/configuration"
  autoload :Response,      "prismdb/response"

  class Error < StandardError; end

  # @return [Prismdb::Configuration]
  def self.config
    @config ||= Configuration.new
  end
end
