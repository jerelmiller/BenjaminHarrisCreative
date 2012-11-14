class Vimeo
  require 'httparty'
  def self.get_video_info(url, options = {})
    HTTParty.get("http://vimeo.com/api/oembed.json?" + { url: url, 
                                                         width: options[:width], 
                                                         height: options[:height],
                                                         byline: false,
                                                         title: false,
                                                         portrait: false
                                                       }.to_query)
  end
end