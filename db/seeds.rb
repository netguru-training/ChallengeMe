# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.first_or_create(:email => "user1@example.com", :password => "changeme")
user2 = User.first_or_create(:email => "user2@example.com", :password => "changeme")
user3 = User.first_or_create(:email => "user3@example.com", :password => "changeme")
user4 = User.first_or_create(:email => "user4@example.com", :password => "changeme")

team1 = Team.first_or_create(:name => "Team A")
team2 = Team.first_or_create(:name => "Team B")

tournament1 = Tournament.first_or_create()

match = Match.first_or_create(:tournament => tournament1, :host => team1, :guest => team2)