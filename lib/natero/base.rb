class Natero::Base
  include Serializable

  BASE_URI = 'https://api.natero.com'
  VERSION_URI = '/api/v2'

  REQUIRED_PARAMS = []

  attr_reader :raw_response

  class << self
    delegate :get, :post, :put, :delete, to: :request_helper, allow_nil: true
  end

  def self.endpoint(*params)
    params = [endpoint_path, params, Natero.api_key_uri].flatten.compact.map(&:to_s)
    Natero.full_endpoint_uri(BASE_URI, VERSION_URI, params)
  end

  def self.endpoint_path
    raise NotImplementedError.new( 'This method needs to be overridden in a child class.  Proper implementation '\
        'should return an array where each index contains a different part of the path.  For example: '\
        '[\'test\', \'best\'] becomes \'/test/best/\'.' )
  end

  def self.json_data(body)
    { body: body, headers: json_headers }
  end

  def self.json_headers
    { 'Content-Type': 'application/json' }
  end

  def self.request_helper
    Natero::RequestHelper.new(self)
  end

  def initialize(params, raw_response = nil)
    missing_params = REQUIRED_PARAMS - params.keys
    raise ArgumentError.new("Missing required params #{missing_params.join(', ')}") unless missing_params.empty?

    load_properties(params)
    @raw_response = raw_response
  end

  def to_json
    serialize
  end

  def load_properties(params)
    model_config_file = "#{Natero.gem_root}/config/model_properties.yml"
    model_config = YAML::load(File.read(model_config_file))[self.class.name.to_s].with_indifferent_access
    model_config[:properties].each do |prop|
      next unless params.include?(prop.to_sym)

      instance_variable_set("@#{prop}", params[prop.to_sym])
      self.class.class_eval { attr_reader prop.to_sym }
    end
  end
end