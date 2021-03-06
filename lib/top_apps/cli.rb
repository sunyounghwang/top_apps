class TopApps::CLI
  def self.run
    create_apps
    greeting
    display_apps
  end

  def self.create_apps
    index_array = TopApps::Scraper.scrape_index("https://www.apple.com/itunes/charts/")
    TopApps::App.create_apps_from_index(index_array)
  end

  def self.add_attributes(app)
    profile_hash = TopApps::Scraper.scrape_profile(app.profile_url)
    app.add_attributes_from_profile(profile_hash)
  end

  def self.greeting
    puts "Welcome to Top Apps!"
    puts "Top Apps is a CLI that displays the hottest apps in the Apple Store right now."
    puts "You can select an app to learn more about it."
  end

  def self.display_apps
    puts "\n"
    puts "Here are the top #{TopApps::App.all.size} free apps in the Apple Store right now:"
    TopApps::App.all.each do |app|
      puts "#{app.rank}. #{app.name} - #{app.category}"
    end
    select_app
  end

  def self.select_app
    puts "\n"
    puts "To learn more about an app, enter its rank."
    puts "To quit, enter 'quit'."
    input = gets.strip.downcase

    if input.to_i.between?(1, TopApps::App.all.size)
      app = TopApps::App.find_by_rank(input)
      add_attributes(app) if !app.developer
      display_profile(input)
    elsif input == "quit"
      quit
    else
      sorry
      select_app
    end
  end

  def self.quit
    puts "\n"
    puts "Thanks for using Top Apps. Goodbye!"
    exit
  end

  def self.sorry
    puts "\n"
    puts "I'm sorry, I don't understand you."
  end

  def self.display_profile(rank)
    app = TopApps::App.find_by_rank(rank)
    puts "\n"
    puts "#{app.name}"
    puts "Ranked ##{app.rank}"
    puts "Category: #{app.category}"
    puts "Developer: #{app.developer}"
    puts "Rating: #{app.rating}"
    puts "Editor's Notes:"
    puts "#{app.notes}"
    back_to_apps
  end

  def self.back_to_apps
    puts "\n"
    puts "If you want to go back to the apps, enter 'back', if you want to quit, enter 'quit'."
    input = gets.strip.downcase

    case input
    when "back"
      display_apps
    when "quit"
      quit
    else
      sorry
      back_to_apps
    end
  end
end
