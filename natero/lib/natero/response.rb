class Natero::Response
  attr_reader :parsed_response, :code

  def initialize(raw_response)
    @parsed_response = raw_response.parsed_response
    @code = raw_response.code
  end
end