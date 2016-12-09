class Natero::Metric < Natero::Base
  def self.retrieve(name)
    get([name])
  end

  def self.bulk_insert_modify(metrics)
    post([], json_data(Natero.to_records_json(metrics)))
  end

  def self.modify(name, metric)
    put([name], json_data(metric.to_json))
  end

  def self.delete(name)
    request_helper.delete([name])
  end

  def self.endpoint_path
    ['metrics']
  end
end
