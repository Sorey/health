# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
u1 = User.create(name: "Admin", email: "33admin44@gmail.com", password: "987789", password_confirmation: "987789")
u2 = User.create(name: "Manager", email: "33manager44@gmail.com", password: "876678", password_confirmation: "876678")
u3 = User.create(name: "User", email: "33user44@gmail.com", password: "765567", password_confirmation: "765567")

Role.delete_all
r1 = Role.create(title: "admin", type_role: 0, parent_id: 0)
r2 = Role.create(title: "manager", type_role: 0, parent_id: r1.id )
r3 = Role.create(title: "user", type_role: 0, parent_id: r2.id)

UserRole.delete_all
u1.roles << [r1]
u2.roles << [r2]
u3.roles << [r3]