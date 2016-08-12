class Natero::Metric
  include HTTParty
  include Serializable

  BASE_URI = 'https://api.natero.com'
  VERSION_URI = '/api/v2'

  attr_reader :account_id, :name, :metrics, :direction, :page, :raw_response

  # http://apidocs.natero.com/apidoc.html#Custom%20Metrics_Retrieve%20a%20metric%20by%20name
  def self.retrieve(name)
    Natero::Response.new(get(endpoint(name)))
  end

  # http://apidocs.natero.com/apidoc.html#Custom%20Metrics_Bulk%20insert%2Fmodify%20metrics
  def self.bulk_insert_modify(metrics)
    body = Natero.to_records_json(metrics)
    Natero::Response.new(post(endpoint, { :body => body, :headers => { 'Content-Type' => 'application/json' } }))
  end

  # http://apidocs.natero.com/apidoc.html#Custom%20Metrics_Modify%20a%20metric
  def self.modify(name, metric)
    body = metric.to_json
    Natero::Response.new(put(endpoint(name), { :body => body, :headers => { 'Content-Type' => 'application/json'} }))
  end

  # http://apidocs.natero.com/apidoc.html#Custom%20Metrics_Delete%20a%20metric
  def self.delete(name)
    Natero::Response.new(delete(endpoint(name)))
  end

  def self.endpoint(*params)
    params = ['metrics'] + params + [Natero.api_key_uri]
    Natero.full_endpoint_uri(BASE_URI, VERSION_URI, params)
  end

  def initialize(params, raw_response = nil)
    @account_id = params['account_id']
    @name	= params['name']
    # Timestamp/Value #
    @metrics = params['metrics']
    ###################
    @direction = params['direction']
    @page = params['page']
    @raw_response = raw_response
  end

  def to_json
    serialize
  end
end
