# frozen_string_literal: true

require "test_helper"

class TestIpgeobase < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_it_has_lookup_method
    ip_meta = Ipgeobase.lookup('8.8.8.8')
    assert ip_meta.city.include?('Ashburn')
  end

  # def test_it_makes_http_request
  #   ADDRESS_XML_DATA = 
  #     '<address>
  #       <street>Milchstrasse</street>
  #       <housenumber>23</housenumber>
  #       <postcode>26131</postcode>
  #       <city>Ashburn</city>
  #       <country code="de">Germany</country>
  #     </address>'
  #   ip_meta = Ipgeobase.lookup('8.8.8.8')
  # end
end
