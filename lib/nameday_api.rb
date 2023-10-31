# frozen_string_literal: true

require 'net/http'
require 'json'

# Class: NamedayApi
class NamedayApi
  BASE_URL = 'https://nameday.abalin.net/api/V1'

  def self.today(country_code = nil, time_zone = nil)
    fetch_data('today', country: country_code, timezone: time_zone)
  end

  def self.tomorrow(country_code = nil, time_zone = nil)
    fetch_data('tomorrow', country: country_code, timezone: time_zone)
  end

  def self.yesterday(country_code = nil, time_zone = nil)
    fetch_data('yesterday', country: country_code, timezone: time_zone)
  end

  def self.specific_day(day, month, country_code = nil)
    options = { day: day, month: month, country: country_code }
    fetch_data('getdate', options)
  end

  def self.search_by_name(name, country_code)
    options = { name: name, country: country_code }
    fetch_data('getname', options)
  end

  def self.fetch_and_parse(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def self.fetch_data(endpoint, options = {})
    url = "#{BASE_URL}/#{endpoint}"

    query_params = options.map { |key, value| "#{key}=#{value}" if value }.compact
    url += "?#{query_params.join('&')}" unless query_params.empty?

    fetch_and_parse(url)
  end
end
