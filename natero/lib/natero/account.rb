class Natero::Account
  include HTTParty

  # http://apidocs.natero.com/apidoc.html#Accounts_Retrieve%20all%20accounts
  def self.retrieve_all
    Natero::Response.new(get(endpoint))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Retrieve%20an%20account
  def self.retrieve(id)
    Natero::Response.new(get(endpoint(id)))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Bulk%20insert%2Fmodify%20accounts
  def self.bulk_insert_modify(accounts)
    Natero::Response.new(post(endpoint, { :body => accounts.to_json }))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Modify%20an%20account
  def self.modify(id, account)
    Natero::Response.new(put(endpoint(id), { :body => account.to_json }))
  end

  def self.endpoint(*params)
    Natero.full_endpoint_uri('accounts', params)
  end
end