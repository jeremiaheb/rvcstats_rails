require 'csv'
namespace :domain do
  desc 'migrates domain information onto domains table'
  task migrate: :environment do
    puts "starting to migrate domains"
    file = ENV['file'].to_s #gets file location from environment
    # Read CSV file
    csv = CSV.read(file, :headers => true)
    d = [] #An array to hold regions/year
    csv.each do |r|
      d << {year: r["YEAR"], region: r["REGION"]}
    end
    # Get unique combinations of year and region
    domains = d.uniq
    # Try to save each domain, raise error if it
    # cannot
    n = 0
    l = domains.length
    domains.each do |d|
      x = Domain.new(d)
      if !x.save
        errors = x.errors.full_messages
        raise "domain with year: #{d[:year]} and region: #{d[:region]}"\
        " could not be saved for the following reasons:"\
        " #{errors.each{|m| puts m}}"
      end
      # Track loop progress
      n += 1
      if n % (l.to_f/20).round == 0
        puts "#{(n.to_f/l * 100).round} percent complete"
      end
    end
    puts "finished migrating domains"
  end
end
