# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Party.destroy_all
Item.destroy_all

User.create([{name: "Colin Kearns", email: "ckearns1210@gmail.com", username: "Colin", password: "Colin", password_confirmation: "Colin"}])
User.create([{name: "Cyrus", email: "cyrus.@gmail.com", username: "Cyrus", password: "Cyrus", password_confirmation: "Cyrus"}])
User.create([{name: "Guy", email: "guy@gmail.com", username: "Guy", password: "Guy", password_confirmation: "Guy"}])
User.create([{name: "Zoe", email: "zoe@gmail.com", username: "Zoe", password: "Zoe", password_confirmation: "Zoe"}])
User.create([{name: "Kate", email: "kate@gmail.com", username: "Kate", password: "Kate", password_confirmation: "Kate"}])
