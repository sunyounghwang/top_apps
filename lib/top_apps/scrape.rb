class TopApps::Scrape
  require "open-uri"
=begin
  index_url = "https://www.apple.com/itunes/charts/"
  apps_section = doc.css(".section.chart-grid.apps div.section-content")
  free_apps_section = doc.css(".section.chart-grid.apps div.section-content").first
  free_apps_list = free_apps_section.css("li")

  index_hash = {
    name: app.css("h3 a").text,
    category: app.css("h4 a").text,
    rank: app.css("strong").text.chomp("."),
    profile_url: app.css("a").attribute("href").value
=end

  def self.scrape_index(index_url)
    index_array = []
    doc = Nokogiri::HTML(open(index_url))
    free_apps_section = doc.css(".section.chart-grid.apps div.section-content").first
    free_apps_list = free_apps_section.css("li")

    free_apps_list.each do |app|
      index_hash = {
        name: app.css("h3 a").text,
        category: app.css("h4 a").text,
        rank: app.css("strong").text.chomp("."),
        profile_url: app.css("a").attribute("href").value
      }
      index_array << index_hash
    end
    index_array
  end

=begin
  profile_url = "https://itunes.apple.com/us/app/tomb-of-the-mask/id1057889290?mt=8&v0=WWW-NAUS-ITSTOP100-FREEAPPS&l=en&ign-mpt=uo%3D4"

  profile_hash = {
    description: doc.css("div.we-editor-notes p").attribute("aria-label").value,
    developer: doc.css("h2.product-header__identity.app-header__identity a").text,
    rating: doc.css("figcaption.we-rating-count.star-rating__count").text.split(",").first
  }
=end

  def self.scrape_profile(profile_url="https://itunes.apple.com/us/app/tomb-of-the-mask/id1057889290?mt=8&v0=WWW-NAUS-ITSTOP100-FREEAPPS&l=en&ign-mpt=uo%3D4")
    doc = Nokogiri::HTML(open(profile_url))
    binding.pry
    profile_hash = {
      description: doc.css("div.we-editor-notes p").attribute("aria-label").value,
      developer: doc.css("h2.product-header__identity.app-header__identity a").text,
      rating: doc.css("figcaption.we-rating-count.star-rating__count").text.split(",").first
    }
  end

end
