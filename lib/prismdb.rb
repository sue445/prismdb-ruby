require "prismdb/version"

module Prismdb
  autoload :Client,        "prismdb/client"
  autoload :Configuration, "prismdb/configuration"

  class Error < StandardError; end

  # @return [Prismdb::Configuration]
  def self.config
    @config ||= Configuration.new
  end
end
