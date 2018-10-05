class TopApps::Scrape
  require "open-uri"
  #index_url = https://www.apple.com/itunes/charts/

  def self.scrape_index(index_url)
    doc = Nokogiri::HTML(open(index_url))
  end

  def self.scrape_profile(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
  end

end
