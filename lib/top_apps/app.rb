class TopApps::App
 @@all = []
 attr_accessor :name, :category, :rank, :profile_url

 def initialize(hash)
   hash.each { |key, value| self.send("#{key}=", value) }
   @@all << self
 end

 def self.create_apps_from_index(index_array)  #index array returned by #scrape_index
   index_array.each { |index_hash| self.new(index_hash) }
 end

 def add_attributes_from_profile(profile_hash)  #profile hash returned by #scrape_profile
   profile_hash.each { |profile_hash| self.send("#{key}=", value) }
 end

end
