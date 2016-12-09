require 'httparty'

module Natero::RequestHelper
  def get(path_params=[], data=nil)
    request(:get, path_params, data)
  end

  def post(path_params=[], data=nil)
    request(:post, path_params, data)
  end

  def put(path_params=[], data=nil)
    request(:put, path_params, data)
  end

  def delete(path_params=[], data=nil)
    request(:delete, path_params, data)
  end

  def request(method, path_params=[], data=nil)
    parse_response(HTTParty.send(method, endpoint(path_params), data))
  end

  def parse_response(raw_response)
    Natero::Response.new(raw_response)
  end
end