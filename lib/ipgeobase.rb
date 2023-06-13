# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'happymapper'
require_relative "ipgeobase/version"

module Ipgeobase
  class Error < StandardError; end
  # Your code goes here...
  #

  def self.lookup(address)
    # HappyMapper.parse(ADDRESS_XML_DATA)

    uri = URI("http://ip-api.com/xml/#{address}")
    response = Net::HTTP.get_response(uri)
    # puts res.body if res.is_a?(Net::HTTPSuccess)
    if response.is_a?(Net::HTTPSuccess)
      puts response.body
      parse_response(response.body)
    end
  end

  def self.parse_response(response)
    HappyMapper.parse(response)
  end

end
