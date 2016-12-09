class Natero::Metric < Natero::Base
  def self.retrieve(name)
    Natero::Response.new(get(endpoint(name)))
  end

  def self.bulk_insert_modify(metrics)
    body = Natero.to_records_json(metrics)
    Natero::Response.new(post(endpoint, { :body => body, :headers => { 'Content-Type' => 'application/json' } }))
  end

  def self.modify(name, metric)
    body = metric.to_json
    Natero::Response.new(put(endpoint(name), { :body => body, :headers => { 'Content-Type' => 'application/json'} }))
  end

  def self.delete(name)
    Natero::Response.new(delete(endpoint(name)))
  end

  def self.endpoint_path
    ['metrics']
  end
end
