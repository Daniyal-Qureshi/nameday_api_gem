# frozen_string_literal: true

require 'nameday_api'
require 'webmock/rspec'

BASE_URL = 'https://nameday.abalin.net/api/V1'

RSpec.describe NamedayApi do
  include NamedayApi

  describe '.today' do
    it 'fetches namedays for today' do
      url = "#{BASE_URL}/today"
      stub_request(:get, url).to_return(body: '{ "dates": { "day": 1, "month": 1 }, "namedays": { "us": "John" } }')
      response = today

      expect(response['dates']['day']).to eq(1)
      expect(response['dates']['month']).to eq(1)
      expect(response['namedays']['us']).to eq('John')
    end

    it 'fetches namedays for today with country code' do
      url = "#{BASE_URL}/today?country=us"
      stub_request(:get, url).to_return(body: '{ "dates": { "day": 1, "month": 1 }, "namedays": { "us": "John" } }')

      response = today('us')

      expect(response['dates']['day']).to eq(1)
      expect(response['dates']['month']).to eq(1)
      expect(response['namedays']['us']).to eq('John')
    end

    it 'fetches namedays for today with time zone' do
      url = "#{BASE_URL}/today?timezone=America/New_York"
      stub_request(:get, url).to_return(body: '{ "dates": { "day": 1, "month": 1 }, "namedays": { "us": "John" } }')

      response = today(nil, 'America/New_York')

      expect(response['dates']['day']).to eq(1)
      expect(response['dates']['month']).to eq(1)
      expect(response['namedays']['us']).to eq('John')
    end
  end

  describe '.yesterday' do
    it 'fetches namedays for yesterday' do
      url = "#{BASE_URL}/yesterday"
      stub_request(:get, url).to_return(body: '{ "dates": { "day": 31, "month": 12 }, "namedays": { "us": "John" } }')

      response = yesterday

      expect(response['dates']['day']).to eq(31)
      expect(response['dates']['month']).to eq(12)
      expect(response['namedays']['us']).to eq('John')
    end

    it 'fetches namedays for yesterday with country code' do
      url = "#{BASE_URL}/yesterday?country=us"
      stub_request(:get, url).to_return(body: '{ "dates": { "day": 31, "month": 12 }, "namedays": { "us": "John" } }')

      response = yesterday('us')

      expect(response['dates']['day']).to eq(31)
      expect(response['dates']['month']).to eq(12)
      expect(response['namedays']['us']).to eq('John')
    end

    it 'fetches namedays for yesterday with time zone' do
      url = "#{BASE_URL}/yesterday?timezone=America/New_York"
      stub_request(:get, url).to_return(body: '{ "dates": { "day": 31, "month": 12 }, "namedays": { "us": "John" } }')

      response = yesterday(nil, 'America/New_York')

      expect(response['dates']['day']).to eq(31)
      expect(response['dates']['month']).to eq(12)
      expect(response['namedays']['us']).to eq('John')
    end
  end

  describe '.tomorrow' do
    it 'fetches namedays for tomorrow' do
      url = "#{BASE_URL}/tomorrow"
      stub_request(:get, url).to_return(body: '{ "dates": { "day": 1, "month": 1 }, "namedays": { "us": "John" } }')

      response = tomorrow

      expect(response['dates']['day']).to eq(1)
      expect(response['dates']['month']).to eq(1)
      expect(response['namedays']['us']).to eq('John')
    end

    it 'fetches namedays for tomorrow with country code' do
      url = "#{BASE_URL}/tomorrow?country=us"
      stub_request(:get, url).to_return(body: '{ "dates": { "day": 1, "month": 1 }, "namedays": { "us": "John" } }')

      response = tomorrow('us')

      expect(response['dates']['day']).to eq(1)
      expect(response['dates']['month']).to eq(1)
      expect(response['namedays']['us']).to eq('John')
    end

    it 'fetches namedays for tomorrow with time zone' do
      url = "#{BASE_URL}/tomorrow?timezone=America/New_York"
      stub_request(:get, url).to_return(body: '{ "dates": { "day": 1, "month": 1 }, "namedays": { "us": "John" } }')

      response = tomorrow(nil, 'America/New_York')

      expect(response['dates']['day']).to eq(1)
      expect(response['dates']['month']).to eq(1)
      expect(response['namedays']['us']).to eq('John')
    end
  end

  describe '.specific_day' do
    it 'fetches namedays for a specific day and month' do
      url = "#{BASE_URL}/getdate?day=1&month=1"
      stub_request(:get, url).to_return(body: '{ "dates": { "day": 1, "month": 1 }, "namedays": { "us": "John" } }')

      response = specific_day(1, 1)

      expect(response['dates']['day']).to eq(1)
      expect(response['dates']['month']).to eq(1)
      expect(response['namedays']['us']).to eq('John')
    end

    it 'fetches namedays for a specific day and month with country code' do
      url = "#{BASE_URL}/getdate?day=1&month=1&country=us"
      stub_request(:get, url).to_return(body: '{ "dates": { "day": 1, "month": 1 }, "namedays": { "us": "John" } }')

      response = specific_day(1, 1, 'us')

      expect(response['dates']['day']).to eq(1)
      expect(response['dates']['month']).to eq(1)
      expect(response['namedays']['us']).to eq('John')
    end
  end

  describe '.search_by_name' do
    it 'fetches namedays for a specific name and country code' do
      name = 'Jan'
      country_code = 'cz'
      url = "#{BASE_URL}/getname?name=Jan&country=cz"

      stub_request(:get,
                   url).to_return(body: '{ "calendar": "cz",
                     "results": [
                    { "day": 24, "month": 5, "name": "Jana" },
                    { "day": 24, "month": 6, "name": "Jan" }]
                  }')

      response = search_by_name(name, country_code)

      expect(response['calendar']).to eq('cz')
      expect(response['results']).to be_an(Array)
      expect(response['results']).not_to be_empty

      # You can add more specific assertions based on your response structure
      expect(response['results'][0]['name']).to eq('Jana')
      expect(response['results'][1]['name']).to eq('Jan')
    end

    it 'fetches namedays for a specific name with a different country code' do
      name = 'John'
      country_code = 'us'
      url = "#{BASE_URL}/getname?name=John&country=us"

      stub_request(:get,
                   url).to_return(body: '{ "calendar": "us", "results": [{ "day": 1, "month": 1, "name": "John" }] }')

      response = search_by_name(name, country_code)

      expect(response['calendar']).to eq('us')
      expect(response['results']).to be_an(Array)
      expect(response['results']).not_to be_empty

      # You can add more specific assertions based on your response structure
      expect(response['results'][0]['name']).to eq('John')
    end
  end
end
