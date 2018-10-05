class TopApps::Scrape
  require "open-uri"
=begin
  index_url = "https://www.apple.com/itunes/charts/"
  index_array = {
    name:
    category:
    rank:
    profile_url:
  }
=end

  def self.scrape_index(index_url)
    doc = Nokogiri::HTML(open(index_url))
  end

  def self.scrape_profile(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
  end

end
