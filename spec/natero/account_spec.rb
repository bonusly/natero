require 'spec_helper'

describe Natero::Account do
  let(:valid_message) { true }
  let(:api_key) { '5000' }
  let(:account) { Struct.new(:id, :name) { def serialize; {id: id, name: name}; end } }

  before do
    allow(Natero.configuration).to receive(:account_api_key).and_return(api_key)
  end

  describe 'retrieve_all' do
    it 'sends the proper request' do
      request_url = "https://api.natero.com/api/v2/accounts/?api_key=#{api_key}"
      data = {}
      method = :get

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.retrieve_all
    end
  end

  describe 'retrieve' do
    it 'sends the proper request' do
      id = 1
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/?api_key=#{api_key}"
      data = {}
      method = :get

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.retrieve(id)
    end
  end

  describe 'bulk_insert_modify' do
    it 'sends the proper request' do
      accounts = [account.new(1, 'test'), account.new(2, 'nest')]
      request_url = "https://api.natero.com/api/v2/accounts/?api_key=#{api_key}"
      data = { body: '{"records": [{:id=>1, :name=>"test"}, {:id=>2, :name=>"nest"}]}',
               headers: {'Content-Type': 'application/json'} }
      method = :post

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.bulk_insert_modify(accounts)
    end
  end

  describe 'modify' do
    it 'sends the proper request' do
      id = 1
      acc = account.new(id, 'test')
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/?api_key=#{api_key}"
      data = { body: '{"id":1,"name":"test"}',
               headers: {'Content-Type': 'application/json'} }
      method = :put

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.modify(id, acc)
    end
  end

  describe 'retrieve_custom_metrics' do
    it 'sends the proper request' do
      id = 1
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/metrics/?api_key=#{api_key}"
      data = {}
      method = :get

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.retrieve_custom_metrics(id)
    end
  end

  describe 'retrieve_invoice_statements' do
    it 'sends the proper request' do
      id = 1
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/statements/?api_key=#{api_key}"
      data = {}
      method = :get

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.retrieve_invoice_statements(id)
    end
  end

  describe 'retrieve_subscription_history' do
    it 'sends the proper request' do
      id = 1
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/subscriptions/?api_key=#{api_key}"
      data = {}
      method = :get

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.retrieve_subscription_history(id)
    end
  end

  describe 'retrieve_support_tickets' do
    it 'sends the proper request' do
      id = 1
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/support_tickets/?api_key=#{api_key}"
      data = {}
      method = :get

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.retrieve_support_tickets(id)
    end
  end

  describe 'retrieve_product_users' do
    it 'sends the proper request' do
      id = 1
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/users/?api_key=#{api_key}"
      data = {}
      method = :get

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.retrieve_product_users(id)
    end
  end

  describe 'retrieve_contacts' do
    it 'sends the proper request' do
      id = 1
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/contacts/?api_key=#{api_key}"
      data = {}
      method = :get

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.retrieve_contacts(id)
    end
  end

  describe 'deactivate_account' do
    it 'sends the proper request' do
      id = 1
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/?api_key=#{api_key}"
      data = {}
      method = :delete

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.deactivate_account(id)
    end
  end

  describe 'delete_stage_history' do
    it 'sends the proper request' do
      id = 1
      name = 'paul'
      timestamp = '1000000'
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/stage_history/#{name}/#{timestamp}/?api_key=#{api_key}"
      data = {}
      method = :delete

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.delete_stage_history(id, name, timestamp)
    end
  end

  describe 'delete_dimension_values' do
    it 'sends the proper request' do
      id = 1
      key = 'so_random'
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/dimension_values/#{key}/?api_key=#{api_key}"
      data = {}
      method = :delete

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.delete_dimension_values(id, key)
    end
  end

  describe 'delete_dimension_labels' do
    it 'sends the proper request' do
      id = 1
      key = 'so_random'
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/dimension_labels/#{key}/?api_key=#{api_key}"
      data = {}
      method = :delete

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.delete_dimension_labels(id, key)
    end
  end

  describe 'delete_assigned_csm_reps' do
    it 'sends the proper request' do
      id = 1
      email = 'bob@acme.com'
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/assigned_csms/#{email}/?api_key=#{api_key}"
      data = {}
      method = :delete

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.delete_assigned_csm_reps(id, email)
    end
  end

  describe 'delete_nps_history' do
    it 'sends the proper request' do
      id = 1
      timestamp = 10000
      request_url = "https://api.natero.com/api/v2/accounts/#{id}/nps_history/#{timestamp}/?api_key=#{api_key}"
      data = {}
      method = :delete

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Account.delete_nps_history(id, timestamp)
    end
  end
end
