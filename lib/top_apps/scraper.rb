class TopApps::Scraper
  require "open-uri"

  def self.scrape_index(index_url)
    doc = Nokogiri::HTML(open(index_url))
    free_apps_section = doc.css(".section.chart-grid.apps div.section-content").first
    free_apps_list = free_apps_section.css("li")

    free_apps_list.map do |app|
      {
        name: app.css("h3 a").text,
        category: app.css("h4 a").text,
        rank: app.css("strong").text.chomp("."),
        profile_url: app.css("a").attribute("href").value
      }
    end
  end

  def self.scrape_profile(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    notes = doc.css("div.we-editor-notes.lockup.ember-view p").text.strip
    notes == "" ? notes = "Unavailable." : nil

    {
      notes: notes,
      developer: doc.css("h2.product-header__identity.app-header__identity a").text,
      rating: doc.css("figcaption.we-rating-count.star-rating__count").text.split(",").first
    }
  end
end
