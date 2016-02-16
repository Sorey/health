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

# Admin::News.delete_all
# Admin::News.create(title: "Переохолодження!", pre_text: "Обережно, переохолодження та обмороження!",
#                    description: "До кінця тижня на Черкащині прогнозують пониження температури до 10 грудусів нижче нуля. У Департаменті охорони здоров'я Черкаської ОДА закликають жителів бути обережними та не переохолоджуватися.",
#                     publish_on: true, image: "child.jpg", user_id: u1.id)
# Admin::News.create(title: "Захист від вірусів", pre_text: "Як слизові оболонки допоможуть захиститися від вірусів",
#                    description: "Аби віруси не потрапляли в організм, слизові оболонки слід оберігати від пересихання. Наступні прості поради допоможуть посилити захист від інфекцій.",
#                    publish_on: true, image: "child.jpg", user_id: u2.id)
# Admin::News.create(title: "Грип", pre_text: "Грип: поширення, симптоми, профілактика",
#                    description: "В Україні спостерігається значне підвищення рівня захворюваності на грип, близьке до епідемічного. МОЗ України наголошує на необхідності дотримання заходів задля попередження зараження грипом та у разі захворювання.",
#                    publish_on: true, image: "child.jpg", user_id: u2.id)