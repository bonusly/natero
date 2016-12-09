class Natero::Base
  extend Natero::RequestHelper
  include Serializable

  BASE_URI = 'https://api.natero.com'
  VERSION_URI = '/api/v2'

  REQUIRED_PARAMS = []

  attr_reader :raw_response

  def self.endpoint(*params)
    params = [endpoint_path, params, Natero.api_key_uri].flatten.compact.map(&:to_s)
    Natero.full_endpoint_uri(BASE_URI, VERSION_URI, params)
  end

  def self.endpoint_path
    raise NotImplementedError.new(
        'This method needs to be overridden in a child class.  Proper implementation should return an array where '\
        'each index contains a different part of the path.  For example: [\'test\', \'best\'] becomes \'/test/best/\'.'
    )
  end

  def self.json_data(body)
    { body: body, headers: json_headers }
  end

  def self.json_headers
    { 'Content-Type': 'application/json' }
  end

  def initialize(params, raw_response = nil)
    missing_params = REQUIRED_PARAMS - params.keys
    raise ArgumentError.new("Missing required params #{missing_params.join(', ')}") unless missing_params.empty?

    params.each do |k, v|
      instance_variable_set("@#{k}", v)
      self.class.class_eval { attr_reader :"#{k}" }
    end
    @raw_response = raw_response
  end

  def to_json
    serialize
  end
end