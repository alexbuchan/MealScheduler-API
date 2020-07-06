# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
date_frequencies = [
  { name: 'DAILY' },
  { name: 'WEEKLY' },
  { name: 'BIWEEKLY' },
  { name: 'MONTHLY' }
]

puts '#####################################################################################################'
puts 'Seeding Date Frequencies...'
puts '#####################################################################################################'

date_frequencies.each do |date_frequency|
  puts "Creating #{date_frequency[:name]} ...", "\n"
  DateFrequency.create(date_frequency)
  puts date_frequency, "\n"
  puts "#{date_frequency[:name]} created"
end

puts '#####################################################################################################'
puts 'Date Frequencies seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength