# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "simplecov"
require "minitest/autorun"
require "webmock/minitest"
require "ipgeobase"

SimpleCov.start do
  add_filter "test/"
end
