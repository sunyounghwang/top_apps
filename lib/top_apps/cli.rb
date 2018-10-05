class TopApps::CLI

    def run
      greeting
      list_apps
    end

    def greeting
      puts "Welcome to Top Apps!"
      puts "Top Apps is a CLI that displays the hottest apps in the Apple Store right now."
      puts "You can select an app to learn more about it."
    end

    def list_apps
      puts "Here are the top 5 free apps in the Apple Store right now:"
    end

end
