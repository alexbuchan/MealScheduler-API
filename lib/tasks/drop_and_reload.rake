# frozen_string_literal: true

namespace :db do
  desc 'Drops the database and then creates, migrates and seeds'
  task :reload do
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
  end
end
