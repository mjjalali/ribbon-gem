require 'json'

module Ribbon
  class Video < Api
    attr_accessor :id, :content_type, :filename, :thumbnail

    # TODO add state
    def initialize(video_id)
      @id = video_id
      response = get_video(video_id)
      raise 'Bad Request' unless response.code == 200
      video_json = JSON.parse(response)
      @content_type = video_json['contentType']
      @filename     = video_json['filename']
      @thumbnail    = video_json['thumbnail']
      @versions     = video_json['versions']
    end

    def self.upload(bucket_id, file)
      # implement html_safe
      response = post("buckets/#{bucket_id}/videos", :video => file)
      upload_json = JSON.parse(response)
      raise 'Bad Request' unless response.code == 200
      upload_json['videoId']
    end

    def encodings
      _encodings = []
      @versions.each do |version|
        _video = version['video']
        _encodings << VideoEncoding.new(_video['filename'], _video['format'], _video['contentType'], _video['url'])
      end
      _encodings
    end

    def ribbon_player(options = {})
      defaults = {:css => 'video-js vjs-default-skin', :width => '320', :height => '132', :preload => @thumbnail, :poster => ''}
      _options = defaults.merge(options)
      sources = encodings.map { |e| "<source type='#{e.content_type}' src='#{e.url}'>" }.join
      <<-PLAYER
        <video class="#{_options[:css]}" controls width="#{_options[:width]}" height="#{_options[:height]}" poster="#{_options[:poster]}" preload="#{_options[:preload]}" data-setup="{}">
          #{sources}
        </video>
      PLAYER
    end

    private 

    def get_video(video_id)
      self.class.get("videos/#{video_id}")
    end
  end
end