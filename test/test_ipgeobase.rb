# frozen_string_literal: true

require "test_helper"

class TestIpgeobase < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  ADDRESS_XML_DATA = 
    '<address>
      <street>Milchstrasse</street>
      <housenumber>23</housenumber>
      <postcode>26131</postcode>
      <city>Ashburn</city>
      <country code="de">Germany</country>
    </address>'.freeze

  def test_it_makes_http_request
    stub_request(:get, "http://ip-api.com/xml/8.8.8.8").
      to_return(status: 200, body: ADDRESS_XML_DATA, headers: {})

    Ipgeobase.lookup('8.8.8.8')
  end

  def test_it_parses_data_correctly
    stub_request(:get, "http://ip-api.com/xml/83.169.216.199").
      to_return(status: 200, body: ADDRESS_XML_DATA, headers: {})

    ip_meta = Ipgeobase.lookup('83.169.216.199')
    assert ip_meta.city.include?('Ashburn')
    assert ip_meta.country.content.include?('Germany')
    assert ip_meta.street.include?('Milchstrasse')
  end
end
