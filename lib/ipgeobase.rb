# frozen_string_literal: true

require_relative "ipgeobase/version"
require 'happymapper'

module Ipgeobase
  class Error < StandardError; end
  # Your code goes here...
  #
  ADDRESS_XML_DATA = 
    '<address>
      <street>Milchstrasse</street>
      <housenumber>23</housenumber>
      <postcode>26131</postcode>
      <city>Ashburn</city>
      <country code="de">Germany</country>
    </address>'

  def self.lookup(address)
    HappyMapper.parse(ADDRESS_XML_DATA)
  end

end
