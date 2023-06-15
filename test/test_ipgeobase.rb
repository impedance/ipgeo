# frozen_string_literal: true

require "test_helper"

class TestIpgeobase < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_it_has_lookup_method
    address_xml_data = 
      '<address>
        <street>Milchstrasse</street>
        <housenumber>23</housenumber>
        <postcode>26131</postcode>
        <city>Ashburn</city>
        <country code="de">Germany</country>
      </address>'.freeze
    stub_request(:get, "http://ip-api.com/xml/8.8.8.8").
      to_return(status: 200, body: address_xml_data, headers: {})

    ip_meta = Ipgeobase.lookup('8.8.8.8')
    assert ip_meta.city.include?('Ashburn')
  end

  # def test_it_makes_http_request
  #   ip_meta = Ipgeobase.lookup('8.8.8.8')
  # end
end
