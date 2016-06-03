require "natero/version"

module Natero
  class Configuration
    attr_accessor :account_api_key, :event_api_key, :event_auth_key

    def initialize
      self.account_api_key = nil
      self.event_api_key = nil
      self.event_auth_key = nil
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configure
      yield(configuration) if block_given?
    end
  end
end