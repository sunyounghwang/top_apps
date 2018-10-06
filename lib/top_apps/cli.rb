class TopApps::CLI
  def self.run
    create_apps
    add_attributes
    greeting
    display_apps
    select_app
  end

  def self.create_apps
    index_array = TopApps::Scrape.scrape_index("https://www.apple.com/itunes/charts/")
    TopApps::App.create_apps_from_index(index_array)
  end

  def self.add_attributes
    TopApps::App.all.each do |app|
      profile_hash = TopApps::Scrape.scrape_profile(app.profile_url)
      app.add_attributes_from_profile(profile_hash)
    end
  end

  def self.greeting
    puts "Welcome to Top Apps!"
    puts "Top Apps is a CLI that displays the hottest apps in the Apple Store right now."
    puts "You can select an app to learn more about it."
    puts "\n"
  end

  def self.select_app
    puts "To learn more about an app, enter its rank (e.g., '1' or '2')."
    puts "To quit, enter 'quit'."
    input = gets.strip

    if input.to_i.between?(1, TopApps::App.all.size)
      display_profile(input)
    elsif input == "quit"
      quit
    else
      puts "\n"
      puts "I'm sorry, I don't understand you."
      select_app
    end
  end

  def self.quit
    puts "Thanks for using Top Apps. Goodbye!"
  end

  def self.display_apps
    puts "Here are the top 5 free apps in the Apple Store right now:"
    TopApps::App.all.each do |app|
      puts "#{app.rank}. #{app.name} - #{app.category}"
    end
    puts "\n"
  end

  def self.display_profile(rank)
    #prompt user to enter "back" or "exit"
    app = TopApps::App.all[rank.to_i - 1]
    puts "\n"
    puts "#{app.name}"
    puts "Ranked ##{app.rank}"
    puts "Category: #{app.category}"
    puts "Developer: #{app.developer}"
    puts "Rating: #{app.rating}"
    puts "Editor's Notes:"
    puts "#{app.notes}"
    puts "\n"
  end

end
