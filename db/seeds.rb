# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.delete_all
u1 = User.create(name: "Admin", email: "33admin44@gmail.com", password: "987789", password_confirmation: "987789")

Role.delete_all
r1 = Role.create(title: "Admin")
r2 = Role.create(title: "Manager")
r3 = Role.create(title: "User")

u1.role << [r1]