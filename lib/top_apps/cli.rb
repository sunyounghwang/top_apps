class TopApps::CLI
  def run
    index_array = TopApps::Scrape.scrape_index("https://www.apple.com/itunes/charts/")
    TopApps::App.create_apps_from_index(array)
    greeting
    display_apps
    end

    def greeting
      puts "Welcome to Top Apps!"
      puts "Top Apps is a CLI that displays the hottest apps in the Apple Store right now."
      puts "You can select an app to learn more about it."
    end

    def display_apps
      puts "Here are the top 5 free apps in the Apple Store right now:"
      #iterate over App.all and puts app information, prompt user to select an app by entering a number
    end

    def display_profile
      #find selected app in App.all and puts selected app's profile, prompt user to enter "back" or "exit"
    end

end
