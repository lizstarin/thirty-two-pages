# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "liz@starin.com", password: "password", first_name: "Liz", last_name: "Starin")
User.create(email: "jason@reigal.com", password: "password", first_name: "Jason", last_name: "Reigal")
User.create(email: "tilly@reigal.com", password: "password", first_name: "Tilly", last_name: "Reigal")
User.create(email: "moogles@starin.com", password: "password", first_name: "Moogles", last_name: "Starin")
User.create(email: "noa@wheeler.com", password: "password", first_name: "Noa", last_name: "Wheeler")
User.create(email: "maurice@leutenegger.com", password: "password", first_name: "Maurice", last_name: "Leutenegger")
