require 'httparty'

class Natero::RequestHelper
  def get(path_params=[], data={})
    request(:get, path_params, data)
  end

  def post(path_params=[], data={})
    request(:post, path_params, data)
  end

  def put(path_params=[], data={})
    request(:put, path_params, data)
  end

  def delete(path_params=[], data={})
    request(:delete, path_params, data)
  end

  def request(method, path_params=[], data={})
    parse_response(HTTParty.send(method, @model.endpoint(path_params), data))
  end

  def parse_response(raw_response)
    Natero::Response.new(raw_response)
  end

  def initialize(model)
    @model = model
  end
end
