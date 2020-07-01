# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
admin_users = [
  { email: 'admin@example.com', password: 'password', password_confirmation: 'password' }
]

puts '#####################################################################################################'
puts 'Seeding Admin Users...'
puts '#####################################################################################################'

admin_users.each do |admin_user|
  puts "Creating #{admin_user[:email]} ...", "\n"
  AdminUser.create(admin_user)
  puts admin_user, "\n"
  puts "#{admin_user[:email]} created"
end

puts '#####################################################################################################'
puts 'Admin Users seeded.'
puts '#####################################################################################################', "\n"
# rubocop:enable Metrics/LineLength