require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts `clear`
puts "    ################################################################"
puts "    ######## ~ L'ancienne base de donnée va être supprimée~ ########"
puts ""
puts "    ----------------------------------------------------------------"

City.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'cities'")
User.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'users'")
Gossip.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'gossips'")
Tag.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'tags'")
TagTable.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'tag_tables'")
PrivateMessage.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'private_messages'")


puts ""
puts "                                    👽 👽  👽 "

puts "    #########################################################################"
puts "    ######## ~                       cities                        ~ ########"
puts ""
puts "    -------------------------------------------------------------------------"
puts ""


10.times do |x|
	city= City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
	puts "City: #{city.name} | #{city.zip_code}"
end 
 	puts ""

	puts "    #########################################################################"
	puts "    ######## ~                      USER                        ~ ########"
	puts ""
	puts "    -------------------------------------------------------------------------"
	puts ""
10.times do |x|
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Company.bs, email: Faker::Internet.email, age: rand(18..99), city_id: rand(1..x))
  puts "User : #{user.first_name} | #{user.last_name} |  #{user.description}  | #{user.email} | #{user.age}"
end
	puts ""

	puts "    #########################################################################"
	puts "    ######## ~                      Gossip                          ~ ########"
	puts "" 
	puts "    -------------------------------------------------------------------------"
	puts ""

10.times do |x|
  gossipe = Gossip.create(user_id: rand(1..10), title: Faker::BreakingBad.episode, content: Faker::ChuckNorris.fact)
  puts "Gossip : #{gossipe.user_id} | #{gossipe.title} |  #{gossipe.content}"
end 
	puts "    #########################################################################"
	puts "    ######## ~                        TAG                          ~ ########"
	puts "" 
	puts "    -------------------------------------------------------------------------"
	puts ""

10.times do |x|
  tag =Tag.create(title: Faker::Pokemon.name)
  puts "Tag: #{tag.title}" 
end 

  	puts "    #########################################################################"
	puts "    ######## ~                      TAG TABLE                      ~ ########"
	puts "" 
	puts "    -------------------------------------------------------------------------"
	puts ""

10.times do |x|
  tagetable =TagTable.create(tag_id: rand(1..x), gossip_id: rand(1..x))
  puts "TagTable : Tag Table #{tagetable.tag_id} |  Gossip_id #{tagetable.gossip_id}"
end 

	puts "    #########################################################################"
	puts "    ######## ~                   Private Message                  ~ ########"
	puts "" 
	puts "    -------------------------------------------------------------------------"
	puts ""

10.times do |x|
  pm = PrivateMessage.create(recipient_id: rand(1..20), sender_id: rand(1..20), content: Faker::Company.bs)
  puts "PrivateMessage:  recipient_id #{pm.recipient_id} |  sender_id #{pm.sender_id} | content #{pm.content}"
end

puts ""
puts ""
puts "              ############🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 ###########"
puts "              ####### ~ Merci pour ta patience ! ~ ###########"
puts "              ############🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 🥰 ###########"