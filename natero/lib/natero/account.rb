class Natero::Account
  include HTTParty

  attr_reader :account_id, :name, :join_date, :renewal_date,
              :billing_account_id, :support_account_id, :crm_account_id,
              :billing_street, :billing_city, :billing_postal_code,
              :billing_state, :billing_country, :phone, :employees,
              :industry, :tier, :csm_score, :sales_rep_name, :sales_rep_email,
              :source, :stage, :is_deleted, :is_churned, :inactive_time, :inactive_reason,
              :assigned_csms, :custom_label_dimensions, :custom_value_dimensions,
              :custom_event_dimensions, :stage_history, :nps_history, :raw_response

  private_class_method :new

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

  # http://apidocs.natero.com/apidoc.html#Accounts_Retrieve%20custom%20metrics
  def self.retrieve_custom_metrics(id)
    Natero::Response.new(get(endpoint(id, 'metrics')))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Retrieve%20invoice%20statements
  def self.retrieve_invoice_statements(id)
    Natero::Response.new(get(endpoint(id, 'statements')))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Retrieve%20subscription%20history
  def self.retrieve_subscription_history(id)
    Natero::Response.new(get(endpoint(id, 'subscriptions')))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Retrieve%20support%20tickets
  def self.retrieve_support_tickets(id)
    Natero::Response.new(get(endpoint(id, 'support_tickets')))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Retrieve%20product%20users
  def self.retrieve_product_users(id)
    Natero::Response.new(get(endpoint(id, 'users')))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Retrieve%20contacts
  def self.retrieve_contacts(id)
    Natero::Response.new(get(endpoint(id, 'contacts')))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Deactivate%20an%20account
  def self.deactivate_account(id)
    Natero::Response.new(delete(endpoint(id)))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Delete%20stage%20history
  def self.delete_stage_history(id, name, timestamp)
    Natero::Response.new(delete(endpoint(id, 'stage_history', name, timestamp)))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Delete%20dimension%20values
  def self.delete_dimension_values(id, key)
    Natero::Response.new(delete(endpoint(id, 'dimension_values', key)))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Delete%20dimension%20labels
  def self.delete_dimension_labels(id, key)
    Natero::Response.new(delete(endpoint(id, 'dimension_labels', key)))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Delete%20assigned%20csm%20reps
  def self.delete_assigned_csm_reps(id, email)
    Natero::Response.new(delete(endpoint(id, 'assigned_csms', email)))
  end

  # http://apidocs.natero.com/apidoc.html#Accounts_Delete%20NPS%20history
  def self.delete_nps_history(id, timestamp)
    Natero::Response.new(delete(endpoint(id, 'nps_history', timestamp)))
  end

  def self.endpoint(*params)
    Natero.full_endpoint_uri('accounts', params)
  end

  def initialize(params, raw_response = nil)
    @account_id = params['account_id']
    @name = params['name']
    @join_date = params['join_date']
    @renewal_date = params['renewal_date']
    @billing_account_id = params['billing_account_id']
    @support_account_id = params['support_account_id']
    @crm_account_id = params['crm_account_id']
    @billing_street = params['billing_street']
    @billing_city = params['billing_city']
    @billing_postal_code = params['billing_postal_code']
    @billing_state = params['billing_state']
    @billing_country = params['billing_country']
    @phone = params['phone']
    @employees = params['employees']
    @industry = params['industry']
    @tier = params['tier']
    @csm_score = params['csm_score']
    @sales_rep_name = params['sales_rep_name']
    @sale_rep_email = params['sale_rep_email']
    @source = params['source']
    @stage = params['stage']
    @is_deleted = params['is_deleted']
    @is_churned = params['is_churned']
    @inactive_time = params['inactive_time']
    @inactive_reason = params['inactive_reason']
    @assigned_csms = params['assigned_csms']
    # Key/value #
    @custom_label_dimensions = params['custom_label_dimensions']
    @custom_value_dimensions = params['custom_value_dimensions']
    @custom_event_dimensions = params['custom_event_dimensions']
    #############
    @stage_history = params['stage_history']
    @nps_history = params['nps_history']
    @raw_response = raw_response
  end
end