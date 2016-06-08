class Natero::Event
  include HTTParty
  include Serializable

  attr_reader

  ##############################################
  ###     Documentation for all endpoints    ###
  ### http://apidocs.natero.com/restapi.html ###
  ##############################################

  REQUIRED_PARAMS = %w{
    'account_id',
    'user_id',
    'created_at',
    'action',
    'session_id'
  }

  def self.identify_user(event)

  end

  def self.identify_account

  end

  def self.session_sync

  end

  def self.module_end

  end

  def self.feature

  end

  def initialize(params, raw_response = nil)
    missing = REQUIRED_PARAMS - params.keys

    unless missing.empty?
      raise ArgumentError.new("Missing required params #{missing.join(', ')}")
    end

    # Base properties - required
    @account_id = params['account_id']
    @user_id = params['user_id']
    @created_at = params['created_at']
    @action = params['action']
    @session_id = params['session_id']
    # Endpoint-specific
    @details = params['details']
    @active_duration = params['active_duration']
    @module = params['module']
    @time_spent = params['time_spent']
    @total = params['total']
  end

  def to_json
    serialize
  end
end