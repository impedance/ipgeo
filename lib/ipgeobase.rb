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
    uri = URI("http://ip-api.com/xml/#{address}")
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      parse_response(response.body)
    end
  end

  def self.parse_response(response)
    result = HappyMapper.parse(response)
    result
  end

end
