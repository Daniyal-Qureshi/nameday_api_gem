# frozen_string_literal: true

require 'net/http'
require 'json'

# Module: NamedayApi
module NamedayApi
  BASE_URL = 'https://nameday.abalin.net/api/V1'

  def fetch_and_parse(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def fetch_data(endpoint, options = {})
    url = "#{BASE_URL}/#{endpoint}"

    query_params = options.map { |key, value| "#{key}=#{value}" if value }.compact
    url += "?#{query_params.join('&')}" unless query_params.empty?

    fetch_and_parse(url)
  end

  def today(country_code = nil, time_zone = nil)
    fetch_data('today', country: country_code, timezone: time_zone)
  end

  def tomorrow(country_code = nil, time_zone = nil)
    fetch_data('tomorrow', country: country_code, timezone: time_zone)
  end

  def yesterday(country_code = nil, time_zone = nil)
    fetch_data('yesterday', country: country_code, timezone: time_zone)
  end

  def specific_day(day, month, country_code = nil)
    options = { day:, month:, country: country_code }
    fetch_data('getdate', options)
  end

  def search_by_name(name, country_code)
    options = { name:, country: country_code }
    fetch_data('getname', options)
  end
end
