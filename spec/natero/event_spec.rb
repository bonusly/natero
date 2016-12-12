require 'spec_helper'

describe Natero::Event do
  let(:valid_message) { true }
  let(:api_key) { '1000' }
  let(:event_api_key) { '5000' }
  let(:event_auth_key) { '12345' }
  let(:event) { Struct.new(:id, :name) { def to_h; {id: id, name: name}; end } }

  before do
    allow(Natero.configuration).to receive(:event_auth_key).and_return(event_auth_key)
    allow(Natero.configuration).to receive(:event_api_key).and_return(event_api_key)
  end

  describe 'create' do
    it 'sends the proper request' do
      evt = event.new(1, 'test')
      request_url = "https://events.natero.com/v1/#{event_auth_key}/#{event_api_key}"
      data = {body: {id:1, name:'test', action:'test'},
              headers: {'Content-Type': 'application/json'}}
      method = :post

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Event.create(evt, 'test')
    end
  end

  describe 'identify_user' do
    it 'sends the proper request' do
      evt = event.new(1, 'test')
      details = 'detail!'
      request_url = "https://events.natero.com/v1/#{event_auth_key}/#{event_api_key}"
      data = {body: {id:1, name:'test', action:'identifyUser', details: details},
              headers: {'Content-Type': 'application/json'}}
      method = :post

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Event.identify_user(evt, details)
    end
  end

  describe 'identify_account' do
    it 'sends the proper request' do
      evt = event.new(1, 'test')
      details = 'detail!'
      request_url = "https://events.natero.com/v1/#{event_auth_key}/#{event_api_key}"
      data = {body: {id:1, name:'test', action:'identifyAccount', details: details},
              headers: {'Content-Type': 'application/json'}}
      method = :post

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Event.identify_account(evt, details)
    end
  end

  describe 'session_sync' do
    it 'sends the proper request' do
      evt = event.new(1, 'test')
      active_duration = 'who_knows!'
      request_url = "https://events.natero.com/v1/#{event_auth_key}/#{event_api_key}"
      data = {body: {id:1, name:'test', action:'sessionSync', active_duration: active_duration},
              headers: {'Content-Type': 'application/json'}}
      method = :post

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Event.session_sync(evt, active_duration)
    end
  end

  describe 'module_end' do
    it 'sends the proper request' do
      evt = event.new(1, 'test')
      module_name = 'test'
      time_spent = 10000
      request_url = "https://events.natero.com/v1/#{event_auth_key}/#{event_api_key}"
      data = {body: {id:1, name:'test', action:'moduleEnd', module: module_name, time_spent: time_spent},
              headers: {'Content-Type': 'application/json'}}
      method = :post

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Event.module_end(evt, module_name, time_spent)
    end
  end

  describe 'feature' do
    it 'sends the proper request' do
      evt = event.new(1, 'test')
      feature = 'best_feature'
      module_name = 'test'
      total = 10000
      request_url = "https://events.natero.com/v1/#{event_auth_key}/#{event_api_key}"
      data = {body: {id:1, name:'test', action:'feature', feature: feature, module: module_name, total: total},
              headers: {'Content-Type': 'application/json'}}
      method = :post

      expect(HTTParty).to receive(method).with(request_url, data).and_return(valid_message)
      expect(Natero::Response).to receive(:new)

      Natero::Event.feature(evt, feature, module_name, total)
    end
  end

  describe 'endpoint' do
    it 'should handle nil params' do
      params = ['one', nil, 'two', nil, 'three']
      final_params = [Natero.configuration.event_auth_key, Natero.configuration.event_api_key, 'one', 'two', 'three']

      expect(Natero).to receive(:full_endpoint_uri).with(Natero::Event::BASE_URI, Natero::Event::VERSION_URI, final_params)

      Natero::Event.endpoint(params)
    end

    it 'should handle nested params' do
      params = [['one', 'two'], 'three']
      final_params = [Natero.configuration.event_auth_key, Natero.configuration.event_api_key, 'one', 'two', 'three']

      expect(Natero).to receive(:full_endpoint_uri).with(Natero::Event::BASE_URI, Natero::Event::VERSION_URI, final_params)

      Natero::Event.endpoint(params)
    end
  end
end