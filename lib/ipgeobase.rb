# frozen_string_literal: true
require 'net/http'
require 'addressable/uri'
require_relative 'ipgeobase/version'
require_relative 'ipgeobase/ip_meta'

module Ipgeobase
  class Error < StandardError; end
  # Your code goes here...

  def self.lookup(ip)
    uri = Addressable::URI.parse("http://ip-api.com/xml/#{ip}")
    xml_data = Net::HTTP.get(uri)
    IPMeta.parse(xml_data)
  end
end
