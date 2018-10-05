class TopApps::CLI
  def run
    create_apps
    add_attributes
    greeting
    display_apps
  end

  def create_apps
    index_array = TopApps::Scrape.scrape_index("https://www.apple.com/itunes/charts/")
    TopApps::App.create_apps_from_index(index_array)
  end

  def add_attributes
    TopApps::App.all.each do |app|
      profile_hash = TopApps::Scrape.scrape_profile(app.profile_url)
      app.add_attributes_from_profile(profile_hash)
    end
  end

  def greeting
    puts "Welcome to Top Apps!"
    puts "Top Apps is a CLI that displays the hottest apps in the Apple Store right now."
    puts "You can select an app to learn more about it."
    puts "\n"
  end

  def display_apps
    puts "Here are the top 5 free apps in the Apple Store right now:"
    #iterate over App.all and puts app information, prompt user to select an app by entering a number
    TopApps::App.all.each do |app|
      puts "#{app.rank}. #{app.name} - #{app.category}"
    end
  end

  def display_profile
    #find selected app in App.all and puts selected app's profile, prompt user to enter "back" or "exit"
  end

end
