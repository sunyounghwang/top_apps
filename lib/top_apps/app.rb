class TopApps::App
 @@all = []
 attr_accessor :name, :category, :rank, :profile_url, :notes, :developer, :rating

 def self.create_apps_from_index(index_array)
   index_array.each { |index_hash| new(index_hash) }
 end

 def self.all
   @@all
 end

 def self.find_by_rank(rank)
   all[rank.to_i - 1]
 end

 def initialize(hash)
   hash.each { |attr_key, attr_value| send("#{attr_key}=", attr_value) }
   @@all << self
 end

 def add_attributes_from_profile(profile_hash)
   profile_hash.each { |attr_key, attr_value| send("#{attr_key}=", attr_value) }
 end
end
