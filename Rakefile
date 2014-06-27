require 'rubygems'
require 'bundler'

desc "Migrate databse"
task :migrate => :environment do
  require './db/migrate'
end

desc "Load seed data"
task :seed => :environment do
  require './db/seed'
end

desc "Console environment"
task :console do
  system 'irb -r "./config/environment"'
end

task :environment do
  ENV["RACK_ENV"] ||= 'development'
  require File.expand_path("../config/environment", __FILE__)
end
