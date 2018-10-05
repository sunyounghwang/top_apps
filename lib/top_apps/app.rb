class TopApps::App
  @@all = []
 attr_accessor :name, :category, :rank, :profile_url

 def initialize(hash)
   hash.each { |key, value| self.send("#{key}=", value) }
   @@all << self
 end

end
