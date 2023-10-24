# NamedayApi Ruby Gem
### Overview
NamedayApi is a custom Ruby gem that provides a simple interface to fetch nameday information from the "nameday.abalin.net" API. Namedays are a tradition in many countries where each day of the year is associated with one or more names. This gem allows you to retrieve nameday information for a specific date, country, or name.

## Installation
To use the NamedayApi gem, you need to include it in your Ruby project. You can do this by adding it to your Gemfile or installing it manually.

### Add to Gemfile:
  <pre><code id="code-block-1">gem 'nameday_api', '~> 1.0.0'</code></pre>
  <button class="btn" data-clipboard-target="#code-block-1"></button>

Install the gem using Bundler:
  <pre><code id="block2">bundle install</code></pre>
  <button class="btn" data-clipboard-target="#block2"></button>

## Usage
  <pre><code id="block3">require 'nameday_api'</code></pre>
  <button class="btn" data-clipboard-target="#block3"></button>

The NamedayApi gem provides several methods to fetch nameday information:
## NamedayApi.today(country_code = nil, time_zone = nil)
Fetches namedays for the current date.

### Parameters:
`country_code` (optional): Country code to specify a country for nameday information.

`time_zone` (optional): Time zone to adjust the date.

## NamedayApi.tomorrow(country_code = nil, time_zone = nil) `
Fetches namedays for the next day.

### Parameters:
`country_code` (optional): Country code to specify a country for nameday information.

`time_zone` (optional): Time zone to adjust the date.

## NamedayApi.yesterday(country_code = nil, time_zone = nil)
Fetches namedays for the previous day.

### Parameters:
`country_code` (optional): Country code to specify a country for nameday information.

`time_zone` (optional): Time zone to adjust the date.

## NamedayApi.specific_day(day, month, country_code = nil)
Fetches namedays for a specific day and month.

### Parameters:
`day`: The day of the month (1-31).

`month`: The month (1-12).

`country_code` (optional): Country code to specify a country for nameday information.

## search_by_name(name, country_code)

Fetches namedays for a specific name and country code.

### Parameters:
`name`: The name you want to search for.

`country_code`: Country code to specify the country for the search.

## Examples

  <pre><code id="block2">#require version 
require 'nameday_api'
      
# Fetch today's namedays
today_info = NamedayApi.today

# Fetch namedays for a specific day and country
specific_day_info = NamedayApi.specific_day(1, 1, 'us')

# Search namedays for a specific name and country
name_info = NamedayApi.search_by_name('Alois', 'us')
      
  </code></pre>
  <button class="btn" data-clipboard-target="#block2"></button>

## Contributions and Open Invitation:**

The NamedayApi gem was initiated by Daniyal Qureshi. I warmly welcome contributions from the open-source community to further improve and expand this project. Feel free to reach out to Daniyal Qureshi at daniyalqureshi.cs@gmail.com with your ideas, questions, and suggestions.

**Getting Started with Contributions:**

You can begin contributing to the project by following these steps:

1. **Create Issues:** Start by creating issues that address bugs, propose enhancements, or discuss new features. This provides a structured way to share your ideas and collaborate on improvements.

2. **Submit Pull Requests:** Once you've identified an issue or have a contribution in mind, you can submit a pull request to implement the changes. Our collaborative environment ensures that your contributions are reviewed and integrated effectively.

By following these steps, you can actively participate in the growth of the NamedayApi gem. We value your input and look forward to working together to make this project even better.
