# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Band.destroy_all
Album.destroy_all

u1 = User.create!(email: "lol@lol.cats", password: "password")

b1 = Band.create!(name: 'Zedd')
b2 = Band.create!(name: 'Porter Robinson')

a1 = Album.create!(band_id: b1.id, title: 'True Colors', year: 2015, live: false)
a2 = Album.create!(band_id: b2.id, title: 'Worlds', year: 2014, live: true)
