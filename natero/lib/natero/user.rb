class Natero::User < Natero::Base
  def self.retrieve_all
    get
  end

  def self.retrieve(id, account_id=nil)
    get([id, account_id])
  end

  def self.bulk_insert_modify(accounts)
    post([], json_data(Natero.to_records_json(accounts)))
  end

  def self.modify(id, account)
    put([id], json_data(account.to_json))
  end

  def self.deactivate(id, account_id=nil)
    delete([id, account_id])
  end

  def self.endpoint_path
    ['account_users']
  end
end