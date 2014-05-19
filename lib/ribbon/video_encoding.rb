module Ribbon
  class VideoEncoding
    attr_accessor :filename, :format, :content_type, :url

    def initialize(filename, format, content_type, url)
      @filename     = filename
      @format       = format
      @content_type = content_type
      @url          = url
    end
  end
end