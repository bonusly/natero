class Natero::Account < Natero::Base
  def self.retrieve_all
    warn "[DEPRECATION] The Natero gem has been deprecated and will no longer be supported. Please switch to using the Freshworks gem. See https://rubygems.org/gems/freshworks and https://github.com/bonusly/freshworks."
    get
  end

  def self.retrieve(id)
    get([id])
  end

  def self.bulk_insert_modify(accounts)
    post([], json_data(Natero.to_records_json(accounts)))
  end

  def self.modify(id, account)
    put([id], json_data(account.to_json))
  end

  def self.retrieve_custom_metrics(id)
    get([id, 'metrics'])
  end

  def self.retrieve_invoice_statements(id)
    get([id, 'statements'])
  end

  def self.retrieve_subscription_history(id)
    get([id, 'subscriptions'])
  end

  def self.retrieve_support_tickets(id)
    get([id, 'support_tickets'])
  end

  def self.retrieve_product_users(id)
    get([id, 'users'])
  end

  def self.retrieve_contacts(id)
    get([id, 'contacts'])
  end

  def self.deactivate_account(id)
    delete([id])
  end

  def self.delete_stage_history(id, name, timestamp)
    delete([id, 'stage_history', name, timestamp])
  end

  def self.delete_dimension_values(id, key)
    delete([id, 'dimension_values', key])
  end

  def self.delete_dimension_labels(id, key)
    delete([id, 'dimension_labels', key])
  end

  def self.delete_assigned_csm_reps(id, email)
    delete([id, 'assigned_csms', email])
  end

  def self.delete_nps_history(id, timestamp)
    delete([id, 'nps_history', timestamp])
  end

  def self.endpoint_path
    ['accounts']
  end
end
