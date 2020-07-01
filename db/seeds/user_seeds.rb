# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
users = [
  { username: 'Regular User', email: 'regular_user@email.com', password: 'password' },
]

puts '#####################################################################################################'
puts 'Seeding Users...'
puts '#####################################################################################################'

users.each do |user|
  puts "Creating #{user[:name]} ...", "\n"
  User.create(user)
  puts user, "\n"
  puts "#{user[:name]} created"
end

puts '#####################################################################################################'
puts 'Users seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength