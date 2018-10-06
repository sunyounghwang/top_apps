class TopApps::App
 @@all = []
 attr_accessor :name, :category, :rank, :profile_url, :notes, :developer, :rating

 def self.create_apps_from_index(index_array)  #index array returned by #scrape_index
   index_array.each { |index_hash| self.new(index_hash) }
 end

 def self.all
   @@all
 end

 def initialize(hash)
   hash.each { |key, value| self.send("#{key}=", value) }
   @@all << self
 end

 def add_attributes_from_profile(profile_hash)  #profile hash returned by #scrape_profile
   profile_hash.each { |key, value| self.send("#{key}=", value) }
 end

end
