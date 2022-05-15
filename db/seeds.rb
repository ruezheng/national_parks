# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# EXAMPLE run rails db:seed after

# So because we added has_many :songs and belongs_to :artist in our models, that is how we can now call in our seeds file artist.songs.create!
# and we can also call song.artist

Hike.destroy_all
Park.destroy_all

zion = Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00)
yellowstone = Park.create!(name: 'Yellowstone National Park', location: 'Wyoming', national_park_pass: true, fee: 35.00)
yosemite = Park.create!(name: 'Yosemite National Park', location: 'California', national_park_pass: false, fee: 15.00)
moab = Park.create!(name: 'Moab National Park', location: 'Utah', national_park_pass: true, fee: 55.00)

hike_1 = Hike.create!(name: 'Hidden Canyon', length_miles: 3, park_id: zion.id, open: true)
hike_2 = Hike.create!(name: 'Angels Landing', length_miles: 5.4, park_id: zion.id, open: true)
hike_3 = Hike.create!(name: 'Upper Geysey Basin', length_miles: 4.9, park_id: yellowstone.id, open: false)
hike_4 = Hike.create!(name: 'Fairy Falls Trail', length_miles: 4.8, park_id: yellowstone.id, open: true)
hike_5 = Hike.create!(name: 'Half Dome', length_miles: 16, park_id: yosemite.id, open: true)
hike_6 = Hike.create!(name: 'Yosemite Falls', length_miles: 7.2, park_id: yosemite.id, open: true)
hike_7 = Hike.create!(name: 'Mesa Arch Trail', length_miles: 0.7, park_id: moab.id, open: true)
hike_8 = Hike.create!(name: 'Dead Horse Rim Loop', length_miles: 5.0, park_id: moab.id, open: true)


# Hike.destroy_all
# Park.destroy_all
#
# prince = Artist.create!(name: 'Prince')
# rtj = Artist.create!(name: 'Run The Jewels')
# caamp = Artist.create!(name: 'Caamp')
# jgb = Artist.create!(name: 'Jerry Garcia Band')
# billie = Artist.create!(name: 'Billie Eilish')
# lcd = Artist.create!(name: 'LCD Soundsystem')
#
# prince.songs.create!(title: 'Raspberry Beret', length: 345, play_count: 34)
# prince.songs.create!(title: 'Purple Rain', length: 524, play_count: 19)
#
# rtj.songs.create!(title: 'Legend Has It', length: 2301, play_count: 2300000)
# rtj.songs.create!(title: 'Talk to Me', length: 2301, play_count: 2300000)
#
# caamp.songs.create!(title: '26', length: 940, play_count: 150000)
# caamp.songs.create!(title: 'Vagabond', length: 240, play_count: 120000)
#
# jgb.songs.create!(title: 'Aint No Bread In The Breadbox', length: 540, play_count: 12000)
# jgb.songs.create!(title: 'The Harder They Come', length: 240, play_count: 120000)
#
# billie.songs.create!(title: 'bury a friend', length: 340, play_count: 1200000)
# billie.songs.create!(title: 'bad guy', length: 240, play_count: 100000)
#
# lcd.songs.create!(title: 'Someone Great', length: 500, play_count: 1000000)
# lcd.songs.create!(title: 'I Can Change', length: 640, play_count: 100000)
