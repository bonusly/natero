require 'httparty'
require 'json'
require 'pry'

module Natero
  include Serializable

  # TODO sandbox available?
  PRODUCTION_URI = 'https://api.natero.com'

  API_VERSION_URI = '/api/v2'

  class Configuration
    attr_accessor :base_uri, :account_api_key, :event_api_key, :event_auth_key

    def initialize
      self.base_uri = PRODUCTION_URI
      self.account_api_key = 'bxwfivxgxulhmyxivwgnmmmalroiy86c'
      self.event_api_key = 'jjpgkgtbtwdegxuirme5mtu7kr6o8u3k'
      self.event_auth_key = 'd745b6cd859839ea5828bc5ad85d7a10'
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration) if block_given?
  end

  def self.full_endpoint_uri(endpoint, *params)
    base = self.uri + '/' + endpoint

    params.each { |param| base << '/' + param } unless params.flatten.empty?

    base + self.api_key_uri
  end

  def self.uri
    Natero.configuration.base_uri + API_VERSION_URI
  end

  def self.api_key_uri
    '?api_key=' + Natero.configuration.account_api_key
  end

  def self.to_records_json(objects)
    {
      'records' => Array(objects).map(&:serialize)
    }
  end
end

require_relative 'natero/serializable'
require_relative 'natero/account'
require_relative 'natero/response'