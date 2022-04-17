require 'happymapper'


class IPMeta
  include HappyMapper

  tag 'query'
  element :city, String, tag: 'city'
  element :country, String, tag: 'country'
  element :country_code, String, tag: 'countryCode'
  element :lat, Float, tag: 'lat'
  element :lon, Float, tag: 'lon'
end