# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.delete_all
# u1 = User.create(name: "Admin", email: "33admin44@gmail.com", password: "987789", password_confirmation: "987789")
# u2 = User.create(name: "Manager", email: "33manager44@gmail.com", password: "876678", password_confirmation: "876678")
# u3 = User.create(name: "User", email: "33user44@gmail.com", password: "765567", password_confirmation: "765567")
#
# Role.delete_all
# r1 = Role.create(title: "admin", type_role: 0, parent_id: 0)
# r2 = Role.create(title: "manager", type_role: 0, parent_id: r1.id )
# r3 = Role.create(title: "user", type_role: 0, parent_id: r2.id)
# r4 = Role.create(title: "admin/newsindex", type_role: 1, parent_id: r2.id)
# r5 = Role.create(title: "admin/newsshow", type_role: 1, parent_id: r2.id)
# r6 = Role.create(title: "admin/newsnew", type_role: 1, parent_id: r2.id)
# r7 = Role.create(title: "admin/newscreate", type_role: 1, parent_id: r2.id)
# r8 = Role.create(title: "admin/newsedit", type_role: 1, parent_id: r2.id)
# r9 = Role.create(title: "admin/newsupdate", type_role: 1, parent_id: r2.id)
# r10 = Role.create(title: "admin/newsdelete", type_role: 1, parent_id: r2.id)
#
# UserRole.delete_all
# u1.roles << [r1]
# u2.roles << [r2]
# u3.roles << [r3]

# Admin::News.delete_all
# Admin::News.create(title: "Переохолодження!", pre_text: "Обережно, переохолодження та обмороження!",
#                    description: "До кінця тижня на Черкащині прогнозують пониження температури до 10 грудусів нижче нуля. У Департаменті охорони здоров'я Черкаської ОДА закликають жителів бути обережними та не переохолоджуватися.",
#                     publish_on: true, user_id: u1.id) #image: "news/child.jpg",
# Admin::News.create(title: "Захист від вірусів", pre_text: "Як слизові оболонки допоможуть захиститися від вірусів",
#                    description: "Аби віруси не потрапляли в організм, слизові оболонки слід оберігати від пересихання. Наступні прості поради допоможуть посилити захист від інфекцій.",
#                    publish_on: true, user_id: u2.id) #image: "news/woman.jpg",
# Admin::News.create(title: "Грип", pre_text: "Грип: поширення, симптоми, профілактика",
#                    description: "В Україні спостерігається значне підвищення рівня захворюваності на грип, близьке до епідемічного. МОЗ України наголошує на необхідності дотримання заходів задля попередження зараження грипом та у разі захворювання.",
#                    publish_on: true, user_id: u2.id) #image: "news/air.jpg",
# Admin::News.create(title: "Проба ополонки!", pre_text: "Обережно, переохолодження та обмороження!",
#                    description: "До кінця тижня на Черкащині прогнозують пониження температури до 10 грудусів нижче нуля. У Департаменті охорони здоров'я Черкаської ОДА закликають жителів бути обережними та не переохолоджуватися.",
#                    publish_on: true, user_id: u2.id) #image: "news/36.jpg",
MedicalSetupCategory.delete_all
msc1 = MedicalSetupCategory.create(name: "First category L1", type_category: "Location")
msc2 = MedicalSetupCategory.create(name: "First category L2", type_category: "Location")
msc3 = MedicalSetupCategory.create(name: "First category L3", type_category: "Location")
msc4 = MedicalSetupCategory.create(name: "Second category", type_category: "Other")
msc5 = MedicalSetupCategory.create(name: "Third category", type_category: "Study")

MedicalSetup.delete_all
ms1 = MedicalSetup.create(name: "Перший заклад 1 Location", address: "Апдреса перша 1", phone: "111 111 111",
                          head_doctor: "Першиий Голова", email: "f111@g.com", category_level: "1", site_address: "http://www.cyberforum.ru/",
                          medical_setup_category_id: msc1.id )
ms2 = MedicalSetup.create(name: "Перший заклад 2 Location", address: "Апдреса перша 1", phone: "111 111 111",
                          head_doctor: "Першиий Голова", email: "f111@g.com", category_level: "1", site_address: "http://www.cyberforum.ru/",
                          medical_setup_category_id: msc2.id )
ms3 = MedicalSetup.create(name: "Перший заклад 3 Location", address: "Апдреса перша 1", phone: "111 111 111",
                          head_doctor: "Першиий Голова", email: "f111@g.com", category_level: "1", site_address: "http://www.cyberforum.ru/",
                          medical_setup_category_id: msc3.id )
ms4 = MedicalSetup.create(name: "Перший заклад 1", address: "Апдреса перша 1", phone: "111 111 111",
                          head_doctor: "Першиий Голова", email: "f111@g.com", category_level: "1", site_address: "http://www.cyberforum.ru/",
                          medical_setup_category_id: msc3.id )
ms5 = MedicalSetup.create(name: "Перший заклад 1 Other", address: "Апдреса перша 1", phone: "111 111 111",
                          head_doctor: "Першиий Голова", email: "f111@g.com", category_level: "1", site_address: "http://www.cyberforum.ru/",
                          medical_setup_category_id: msc4.id )
ms6 = MedicalSetup.create(name: "Перший заклад 1 Study", address: "Апдреса перша 1", phone: "111 111 111",
                          head_doctor: "Першиий Голова", email: "f111@g.com", category_level: "1", site_address: "http://www.cyberforum.ru/",
                          medical_setup_category_id: msc5.id )

t1 = Time.now.strftime('%F')
t2 = Time.now.change(year: 2018).strftime('%F')

MedicalSetupLicense.delete_all
msl1 = MedicalSetupLicense.create(date_start: t1, date_finish: t2, number_license: "AB 237194", medical_setup_id: ms1.id )
msl2 = MedicalSetupLicense.create(date_start: t1, date_finish: t2, number_license: "AB 237194", medical_setup_id: ms2.id )
msl3 = MedicalSetupLicense.create(date_start: t1, date_finish: t2, number_license: "AB 237194", medical_setup_id: ms3.id )
msl4 = MedicalSetupLicense.create(date_start: t1, date_finish: t2, number_license: "AB 237194", medical_setup_id: ms4.id )
msl5 = MedicalSetupLicense.create(date_start: t1, date_finish: t2, number_license: "AB 237194", medical_setup_id: ms5.id )
msl6 = MedicalSetupLicense.create(date_start: t2, date_finish: t1, number_license: "AB 237194", medical_setup_id: ms6.id )