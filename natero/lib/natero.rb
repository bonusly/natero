require 'httparty'
require 'json'

module Natero
  class Configuration
    attr_accessor :base_uri, :account_api_key, :event_api_key, :event_auth_key

    def initialize
      self.account_api_key = nil
      self.event_api_key = nil
      self.event_auth_key = nil
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.full_endpoint_uri(base_uri, version_uri, *params)
    base = self.uri(base_uri, version_uri)

    params.flatten!
    params.each { |param| base << '/' + param } unless params.empty?

    base
  end

  def self.uri(base_uri, version_uri)
    base_uri + version_uri
  end

  def self.api_key_uri
    '?api_key=' + Natero.configuration.account_api_key
  end

  def self.to_records_json(objects)
    "{\"records\": #{Array(objects).map(&:serialize)}}".to_s.delete('\\').gsub('"{', '{').gsub('}"', '}')
  end
end

require_relative 'natero/serializable'
require_relative 'natero/account'
require_relative 'natero/event'
require_relative 'natero/response'
require_relative 'natero/metric'
