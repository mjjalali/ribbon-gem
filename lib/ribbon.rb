require "ribbon/configuration"
require "ribbon/api"
require "ribbon/video_encoding"
require "ribbon/video"
require "ribbon/version"

require 'rails/generators'
require 'generators/ribbon/ribbon_generator'

module Ribbon
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
