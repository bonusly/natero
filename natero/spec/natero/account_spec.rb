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
      data = nil
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
      data = nil
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
end