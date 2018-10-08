class TopApps::App
 @@all = []
 attr_accessor :name, :category, :rank, :profile_url, :notes, :developer, :rating

 def self.create_apps_from_index(index_array)
   index_array.each { |index_hash| new(index_hash) }
 end

 def self.all
   @@all
 end

 def initialize(hash)
   hash.each { |key, value| send("#{key}=", value) }
   @@all << self
 end

 def add_attributes_from_profile(profile_hash)
   profile_hash.each { |key, value| send("#{key}=", value) }
 end

end
