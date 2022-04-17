# frozen_string_literal: true

require "test_helper"
require 'webmock/minitest'

class TestIpgeobase < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_lookup
    stub_request(:get, "http://ip-api.com/xml/8.8.8.8")
      .to_return(body: "<?xml version=\"1.0\" encoding=\"UTF-8\"?><query>  
        <country>Russia</country>
        <countryCode>Ru</countryCode>
        <region>VA</region>
        <city>Arhangelsk</city> 
        <lat>39.03</lat>
        <lon>-77.5</lon>
        </query>")
    ip_data = Ipgeobase.lookup('8.8.8.8')
    assert_equal ip_data.country, "Russia"
    assert_equal ip_data.country_code, "Ru"
    assert_equal ip_data.city, "Arhangelsk"
    assert_equal ip_data.lat, 39.03
    assert_equal ip_data.lon, -77.5
  end
end
