class Natero::Event < Natero::Base
  REQUIRED_PARAMS = %w{
    account_id
    user_id
    created_at
    session_id
  }

  def self.identify_user(event, details)
    create_event(event, 'identifyUser', { details: details })
  end

  def self.identify_account(event, details)
    create_event(event, 'identifyAccount', { details: details })
  end

  def self.session_sync(event, active_duration)
    create_event(event, 'sessionSync', { active_duration: active_duration })
  end

  def self.module_end(event, module_name, time_spent)
    create_event(event, 'moduleEnd', { module: module_name, time_spent: time_spent })
  end

  def self.feature(event, feature, module_name, total)
    create_event(event, 'feature', { feature: feature, module: module_name, total: total })
  end

  def self.create_event(event, action, optional_fields={})
    body = event.to_h
    body.merge!({ action: action })
    body.merge!(optional_fields)

    post([], json_data(body))
  end

  def self.endpoint
    Natero.full_endpoint_uri(
      BASE_URI,
      VERSION_URI,
      Natero.configuration.event_auth_key,
      Natero.configuration.event_api_key
    )
  end
end