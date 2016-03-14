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
# r1 = Role.create(title: "admin", type_role: 0, parents: [r1] )
# r2 = Role.create(title: "manager", type_role: 0, parents: [r1])
# r3 = Role.create(title: "user", type_role: 0, parents: [r2])
# r4 = Role.create(title: "admin/newsindex", type_role: 1, parents: [r2])
# r5 = Role.create(title: "admin/newsshow", type_role: 1, parents: [r2])
# r6 = Role.create(title: "admin/newsnew", type_role: 1, parents: [r2])
# r7 = Role.create(title: "admin/newscreate", type_role: 1, parents: [r2])
# r8 = Role.create(title: "admin/newsedit", type_role: 1, parents: [r2])
# r9 = Role.create(title: "admin/newsupdate", type_role: 1, parents: [r2])
# r10 = Role.create(title: "admin/newsdelete", type_role: 1, parents: [r2])

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
# # UserRole.delete_all
# u1.roles << [r1]
# u2.roles << [r2]
# u3.roles << [r3]

# MenuItem.delete_all
# m1 = MenuItem.create(title: "Департамент охорони здоров'я", type_level: "Заголовок меню", type_item: "Головне меню",
#                      parent_id: 0, link: "", show: true, order_item: 1)
# m5 = MenuItem.create(title: "Про департамент", type_level: "Перший рівень", type_item: "Головне меню",
#                      parent_id: m1.id, link: "http://www.vin.gov.ua/web/upravlinnya/web_upr_zdor.nsf/webgr_view/main?OpenDocument&count=15&RestrictToCategory=GrA9ALH", show: true, order_item: 1)
# m6 = MenuItem.create(title: "Структура", type_level: "Перший рівень", type_item: "Головне меню",
#                      parent_id: m1.id, link: "/structure", show: true, order_item: 2)
# m7 = MenuItem.create(title: "Працівники ДОЗ", type_level: "Перший рівень", type_item: "Головне меню",
#                      parent_id: m1.id, link: "", show: true, order_item: 3)
# m8 = MenuItem.create(title: "Графік прийому громадян", type_level: "Перший рівень", type_item: "Головне меню",
#                      parent_id: m1.id, link: "/schedule", show: true, order_item: 4)
# m9 = MenuItem.create(title: "Головні позаштатні спеціалісти ДОЗ", type_level: "Перший рівень", type_item: "Головне меню",
#                      parent_id: m1.id, link: "", show: true, order_item: 5)
#
# m2 = MenuItem.create(title: "Медичні заклади", type_level: "Заголовок меню", type_item: "Головне меню",
#                      parent_id: 0, link: "", show: true, order_item: 2)
# m10 = MenuItem.create(title: "Первинного рівня", type_level: "Перший рівень", type_item: "Головне меню",
#                      parent_id: m2.id, link: "", show: true, order_item: 1)
# m11 = MenuItem.create(title: "Вторинного рівня (спеціалізовані)", type_level: "Перший рівень", type_item: "Головне меню",
#                      parent_id: m2.id, link: "", show: true, order_item: 2)
# m12 = MenuItem.create(title: "Третинного рівня  (високоспеціалізовані)", type_level: "Перший рівень", type_item: "Головне меню",
#                      parent_id: m2.id, link: "", show: true, order_item: 3)
# m13 = MenuItem.create(title: "Санаторії", type_level: "Перший рівень", type_item: "Головне меню",
#                      parent_id: m2.id, link: "", show: true, order_item: 4)
# m14 = MenuItem.create(title: "Швидка медична допомога", type_level: "Перший рівень", type_item: "Головне меню",
#                      parent_id: m2.id, link: "", show: true, order_item: 5)
# m15 = MenuItem.create(title: "Будинки дитини", type_level: "Перший рівень", type_item: "Головне меню",
#                      parent_id: m2.id, link: "", show: true, order_item: 6)
#
# m3 = MenuItem.create(title: "Нормативна база", type_level: "Заголовок меню", type_item: "Головне меню",
#                      parent_id: 0, link: "", show: true, order_item: 3)
# m16 = MenuItem.create(title: "Нормативна база МОЗ", type_level: "Перший рівень", type_item: "Головне меню",
#                       parent_id: m3.id, link: "http://moz.gov.ua/ua/portal/publrel_standbase.html", show: true, order_item: 1)
# m17 = MenuItem.create(title: "Програми", type_level: "Перший рівень", type_item: "Головне меню",
#                       parent_id: m3.id, link: "http://www.vin.gov.ua/web/upravlinnya/web_upr_zdor.nsf/webgr_view/GrNVGFM?OpenDocument&count=5&RestrictToCategory=GrNVGFM", show: true, order_item: 2)
# m18 = MenuItem.create(title: "Розпорядження голови ОДА", type_level: "Перший рівень", type_item: "Головне меню",
#                       parent_id: m3.id, link: "http://www.vin.gov.ua/web/vinoda.nsf/webgr_view/Gr68F7P?OpenDocument&count=5&RestrictToCategory=Gr68F7P", show: true, order_item: 3)
# m19 = MenuItem.create(title: "Рішення обласної Ради", type_level: "Перший рівень", type_item: "Головне меню",
#                       parent_id: m3.id, link: "http://www.vinrada.gov.ua/proekti_rishen.htm", show: true, order_item: 4)
# m20 = MenuItem.create(title: "Накази ДОЗ", type_level: "Перший рівень", type_item: "Головне меню",
#                       parent_id: m3.id, link: "", show: true, order_item: 5)
# m21 = MenuItem.create(title: "Рішення засідань колегії ДОЗ", type_level: "Перший рівень", type_item: "Головне меню",
#                       parent_id: m3.id, link: "", show: true, order_item: 6)
# m22 = MenuItem.create(title: "План роботи ДОЗ", type_level: "Перший рівень", type_item: "Головне меню",
#                       parent_id: m3.id, link: "", show: true, order_item: 7)
# m23 = MenuItem.create(title: "Комплексний план", type_level: "Додатковий рівень", type_item: "Головне меню",
#                       parent_id: m22.id, link: "", show: true, order_item: 1)
# m24 = MenuItem.create(title: "План роботи на місяць", type_level: "Додатковий рівень", type_item: "Головне меню",
#                       parent_id: m22.id, link: "", show: true, order_item: 2)
#
#
# m4 = MenuItem.create(title: "Контакти", type_level: "Пункт меню", type_item: "Головне меню",
#                      parent_id: 0, link: "#contacts", show: true, order_item: 4)
#
#
# # MenuItem.delete_all
#
#
# r_m1 = MenuItem.create(title: "Основні показники діяльності охорони здоров'я", type_level: "Пункт меню", type_item: "Бокове меню",
#                      parent_id: 0, link: "", show: true, order_item: 1)
#
# r_m2 = MenuItem.create(title: "Впровадження сучасних методик та технологій", type_level: "Заголовок меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "", show: true, order_item: 2)
# r_m2_1 = MenuItem.create(title: "Реєстр методичних рекомендацій, інформаційних листів (ІАЦМС)", type_level: "Перший рівень", type_item: "Бокове меню",
#                      parent_id: r_m2.id, link: "", show: true, order_item: 1)
# r_m2_2 = MenuItem.create(title: "Інформаційний бюлетень", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m2.id, link: "http://www.amnu.gov.ua/index.php?p=articles&action=displayarticle&id=83", show: true, order_item: 2)
#
# r_m3 = MenuItem.create(title: "Акредитація закладів охорони здоров'я", type_level: "Заголовок меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "", show: true, order_item: 3)
# r_m3_1 = MenuItem.create(title: "Нормативна база", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m3.id, link: "", show: true, order_item: 1)
# r_m3_2 = MenuItem.create(title: "Плани та виконання", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m3.id, link: "", show: true, order_item: 2)
#
# r_m4 = MenuItem.create(title: "Державні закупівлі", type_level: "Заголовок меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "#", show: true, order_item: 4)
# r_m4_1 = MenuItem.create(title: "2014 рік", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m4.id, link: "#", show: true, order_item: 1)
# r_m4_2 = MenuItem.create(title: "2015 рік", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m4.id, link: "#", show: true, order_item: 2)
# r_m4_3 = MenuItem.create(title: "Перелік закуплених лікарських засобів ДПЗ", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m4.id, link: "#", show: true, order_item: 3)
# r_m4_4 = MenuItem.create(title: "Забезпеченість за кошти державного бюджету", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m4.id, link: "#", show: true, order_item: 4)
# r_m4_5 = MenuItem.create(title: "Забезпеченість за іншими джерелами фінансування", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m4.id, link: "#", show: true, order_item: 5)
#
# r_m5 = MenuItem.create(title: "Бібліотека", type_level: "Пункт меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "http://vinmedlib.org.ua/", show: true, order_item: 5)
#
# r_m6 = MenuItem.create(title: "Про створення ЄСЕМД в області", type_level: "Пункт меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "http://www.content.net.ua/registration/index.php?id=5915", show: true, order_item: 6)
#
# r_m7 = MenuItem.create(title: "Національна лінія телефону довіри", type_level: "Заголовок меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "#", show: true, order_item: 7)
# r_m7_1 = MenuItem.create(title: "ВІЛ/СНІД", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m7.id, link: "http://aidscenter.org/", show: true, order_item: 1)
# r_m7_2 = MenuItem.create(title: "Електронна приймальня для пацієнтів", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m7.id, link: "http://dssz.gov.ua/index.php/?option=com_content&view=article&id=1551:sendform&catid=475:othe", show: true, order_item: 2)
#
# r_m8 = MenuItem.create(title: "Волонтерство", type_level: "Заголовок меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "#", show: true, order_item: 8)
# r_m8_1 = MenuItem.create(title: "Допомога учасникам бойових дій", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m8.id, link: "http://aidscenter.org/", show: true, order_item: 1)
# r_m8_2 = MenuItem.create(title: "Волонтерські організації", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m8.id, link: "#", show: true, order_item: 2)
# r_m8_3 = MenuItem.create(title: "Благодійність", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m8.id, link: "#", show: false, order_item: 3)
#
# r_m9 = MenuItem.create(title: "Соціальні проекти", type_level: "Пункт меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "http://www.content.net.ua/registration/index.php?id=5915", show: true, order_item: 9)
#
# r_m10 = MenuItem.create(title: "Фотоматеріали", type_level: "Пункт меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "http://www.content.net.ua/registration/index.php?id=5915", show: true, order_item: 10)
#
# r_m11 = MenuItem.create(title: "Відеоматеріали", type_level: "Пункт меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "http://www.content.net.ua/registration/index.php?id=5915", show: true, order_item: 11)
#
# r_m12 = MenuItem.create(title: "Гаряча лінія", type_level: "Заголовок меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "#", show: true, order_item: 12)
# r_m12_1 = MenuItem.create(title: "Он-лайн допомога", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m12.id, link: "#", show: true, order_item: 1)
# r_m12_2 = MenuItem.create(title: "Цілодобова телефонна допомога", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m12.id, link: "#", show: true, order_item: 2)
# r_m12_3 = MenuItem.create(title: "Телефон довіри", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m12.id, link: "#", show: true, order_item: 3)
# r_m12_4 = MenuItem.create(title: "Гаряча лінія з питань реформування охорони здоров`я", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m12.id, link: "#", show: true, order_item: 4)
# r_m12_5 = MenuItem.create(title: "Гаряча лінія З метою забезпечення оперативного реагування на звернення громадян в МОЗ", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m12.id, link: "#", show: true, order_item: 5)
# r_m12_6 = MenuItem.create(title: "Гаряча лінія з питань роботи екстреної медичної допомоги та медицини катастроф", type_level: "Перший рівень", type_item: "Бокове меню",
#                           parent_id: r_m12.id, link: "#", show: true, order_item: 6)
# r_m12_7 = MenuItem.create(title: "Гаряча лінія «АНТИ-ГРИП»", type_level: "Перший рівень", type_item: "Бокове меню",
#                           parent_id: r_m12.id, link: "#", show: true, order_item: 7)
# r_m12_8 = MenuItem.create(title: "Прес-центр", type_level: "Перший рівень", type_item: "Бокове меню",
#                           parent_id: r_m12.id, link: "#", show: true, order_item: 8)
# r_m12_8_1 = MenuItem.create(title: "Повідомлення та заяви", type_level: "Додатковий рівень", type_item: "Бокове меню",
#                       parent_id: r_m12_8.id, link: "http://aidscenter.org/", show: true, order_item: 1)
# r_m12_8_2 = MenuItem.create(title: "Реагування на критику", type_level: "Додатковий рівень", type_item: "Бокове меню",
#                       parent_id: r_m12_8.id, link: "http://aidscenter.org/", show: true, order_item: 2)
# r_m12_8_2 = MenuItem.create(title: "Форма та порядок подання", type_level: "Додатковий рівень", type_item: "Бокове меню",
#                       parent_id: r_m12_8.id, link: "http://aidscenter.org/", show: true, order_item: 3)
# r_m12_9 = MenuItem.create(title: "Звернення громадян.  Інформаційний куточок", type_level: "Перший рівень", type_item: "Бокове меню",
#                           parent_id: r_m12.id, link: "#", show: true, order_item: 9)
#
# r_m13 = MenuItem.create(title: "Здоровий спосіб життя", type_level: "Заголовок меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "#", show: true, order_item: 13)
# r_m13_1 = MenuItem.create(title: "Здорове життя (бюлетені, Пам'ятка для тих, хто здійснює санітарно-просвітницьку роботу)", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m13.id, link: "http://aidscenter.org/", show: true, order_item: 1)
# r_m13_2 = MenuItem.create(title: "Блок громадського здоров’я", type_level: "Перший рівень", type_item: "Бокове меню",
#                          parent_id: r_m13.id, link: "http://dssz.gov.ua/index.php/?option=com_content&view=article&id=1551:sendform&catid=475:othe", show: true, order_item: 2)
#
#
# r_m14 = MenuItem.create(title: "Публічна інформація", type_level: "Пункт меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "#", show: true, order_item: 14)
#
# r_m15 = MenuItem.create(title: "Державно-приватне партнерство", type_level: "Пункт меню", type_item: "Бокове меню",
#                        parent_id: 0, link: "#", show: true, order_item: 15)



# --- New seeds ---
# Admin::User.delete_all
# a_u1 = Admin::User.create(name: "Admin", email: "33admin44@gmail.com", password: "987789", password_confirmation: "987789")
# a_u2 = Admin::User.create(name: "Manager", email: "33manager44@gmail.com", password: "876678", password_confirmation: "876678")
# a_u3 = Admin::User.create(name: "User", email: "33user44@gmail.com", password: "765567", password_confirmation: "765567")
#
# Admin::Role.delete_all
# a_r1 = Admin::Role.create(title: "admin", type_role: 0, parent_id: 0)
# a_r2 = Admin::Role.create(title: "manager", type_role: 0, parent_id: a_r1.id)
# a_r3 = Admin::Role.create(title: "user", type_role: 0, parent_id: a_r2.id)
# a_r4 = Admin::Role.create(title: "admin/newsindex", type_role: 1, parent_id: a_r2.id)
# a_r5 = Admin::Role.create(title: "admin/newsshow", type_role: 1, parent_id: a_r2.id)
# a_r6 = Admin::Role.create(title: "admin/newsnew", type_role: 1, parent_id: a_r2.id)
# a_r7 = Admin::Role.create(title: "admin/newscreate", type_role: 1, parent_id: a_r2.id)
# a_r8 = Admin::Role.create(title: "admin/newsedit", type_role: 1, parent_id: a_r2.id)
# a_r9 = Admin::Role.create(title: "admin/newsupdate", type_role: 1, parent_id: a_r2.id)
# a_r10 = Admin::Role.create(title: "admin/newsdelete", type_role: 1, parent_id: a_r2.id)
#
# a_u1.admin_roles << [a_r1]
# a_u2.admin_roles << [a_r2]
# a_u3.admin_roles << [a_r3]



Admin::MenuItem.delete_all
m1 = Admin::MenuItem.create(title: "Департамент охорони здоров'я", type_level: "Заголовок меню", type_item: "Головне меню",
                     parent_id: 0, link: "", show: true, order_item: 1)
m5 = Admin::MenuItem.create(title: "Про департамент", type_level: "Перший рівень", type_item: "Головне меню",
                     parent_id: m1.id, link: "http://www.vin.gov.ua/web/upravlinnya/web_upr_zdor.nsf/webgr_view/main?OpenDocument&count=15&RestrictToCategory=GrA9ALH", show: true, order_item: 1)
m6 = Admin::MenuItem.create(title: "Структура", type_level: "Перший рівень", type_item: "Головне меню",
                     parent_id: m1.id, link: "/structure", show: true, order_item: 2)
m7 = Admin::MenuItem.create(title: "Працівники ДОЗ", type_level: "Перший рівень", type_item: "Головне меню",
                     parent_id: m1.id, link: "", show: true, order_item: 3)
m8 = Admin::MenuItem.create(title: "Графік прийому громадян", type_level: "Перший рівень", type_item: "Головне меню",
                     parent_id: m1.id, link: "/schedule", show: true, order_item: 4)
m9 = Admin::MenuItem.create(title: "Головні позаштатні спеціалісти ДОЗ", type_level: "Перший рівень", type_item: "Головне меню",
                     parent_id: m1.id, link: "", show: true, order_item: 5)

m2 = Admin::MenuItem.create(title: "Медичні заклади", type_level: "Заголовок меню", type_item: "Головне меню",
                     parent_id: 0, link: "", show: true, order_item: 2)
m10 = Admin::MenuItem.create(title: "Первинного рівня", type_level: "Перший рівень", type_item: "Головне меню",
                     parent_id: m2.id, link: "", show: true, order_item: 1)
m11 = Admin::MenuItem.create(title: "Вторинного рівня (спеціалізовані)", type_level: "Перший рівень", type_item: "Головне меню",
                     parent_id: m2.id, link: "", show: true, order_item: 2)
m12 = Admin::MenuItem.create(title: "Третинного рівня  (високоспеціалізовані)", type_level: "Перший рівень", type_item: "Головне меню",
                     parent_id: m2.id, link: "", show: true, order_item: 3)
m13 = Admin::MenuItem.create(title: "Санаторії", type_level: "Перший рівень", type_item: "Головне меню",
                     parent_id: m2.id, link: "", show: true, order_item: 4)
m14 = Admin::MenuItem.create(title: "Швидка медична допомога", type_level: "Перший рівень", type_item: "Головне меню",
                     parent_id: m2.id, link: "", show: true, order_item: 5)
m15 = Admin::MenuItem.create(title: "Будинки дитини", type_level: "Перший рівень", type_item: "Головне меню",
                     parent_id: m2.id, link: "", show: true, order_item: 6)

m3 = Admin::MenuItem.create(title: "Нормативна база", type_level: "Заголовок меню", type_item: "Головне меню",
                     parent_id: 0, link: "", show: true, order_item: 3)
m16 = Admin::MenuItem.create(title: "Нормативна база МОЗ", type_level: "Перший рівень", type_item: "Головне меню",
                      parent_id: m3.id, link: "http://moz.gov.ua/ua/portal/publrel_standbase.html", show: true, order_item: 1)
m17 = Admin::MenuItem.create(title: "Програми", type_level: "Перший рівень", type_item: "Головне меню",
                      parent_id: m3.id, link: "http://www.vin.gov.ua/web/upravlinnya/web_upr_zdor.nsf/webgr_view/GrNVGFM?OpenDocument&count=5&RestrictToCategory=GrNVGFM", show: true, order_item: 2)
m18 = Admin::MenuItem.create(title: "Розпорядження голови ОДА", type_level: "Перший рівень", type_item: "Головне меню",
                      parent_id: m3.id, link: "http://www.vin.gov.ua/web/vinoda.nsf/webgr_view/Gr68F7P?OpenDocument&count=5&RestrictToCategory=Gr68F7P", show: true, order_item: 3)
m19 = Admin::MenuItem.create(title: "Рішення обласної Ради", type_level: "Перший рівень", type_item: "Головне меню",
                      parent_id: m3.id, link: "http://www.vinrada.gov.ua/proekti_rishen.htm", show: true, order_item: 4)
m20 = Admin::MenuItem.create(title: "Накази ДОЗ", type_level: "Перший рівень", type_item: "Головне меню",
                      parent_id: m3.id, link: "", show: true, order_item: 5)
m21 = Admin::MenuItem.create(title: "Рішення засідань колегії ДОЗ", type_level: "Перший рівень", type_item: "Головне меню",
                      parent_id: m3.id, link: "", show: true, order_item: 6)
m22 = Admin::MenuItem.create(title: "План роботи ДОЗ", type_level: "Перший рівень", type_item: "Головне меню",
                      parent_id: m3.id, link: "", show: true, order_item: 7)
m23 = Admin::MenuItem.create(title: "Комплексний план", type_level: "Додатковий рівень", type_item: "Головне меню",
                      parent_id: m22.id, link: "", show: true, order_item: 1)
m24 = Admin::MenuItem.create(title: "План роботи на місяць", type_level: "Додатковий рівень", type_item: "Головне меню",
                      parent_id: m22.id, link: "", show: true, order_item: 2)


m4 = Admin::MenuItem.create(title: "Контакти", type_level: "Пункт меню", type_item: "Головне меню",
                     parent_id: 0, link: "#contacts", show: true, order_item: 4)


# MenuItem.delete_all


r_m1 = Admin::MenuItem.create(title: "Основні показники діяльності охорони здоров'я", type_level: "Пункт меню", type_item: "Бокове меню",
                     parent_id: 0, link: "", show: true, order_item: 1)

r_m2 = Admin::MenuItem.create(title: "Впровадження сучасних методик та технологій", type_level: "Заголовок меню", type_item: "Бокове меню",
                       parent_id: 0, link: "", show: true, order_item: 2)
r_m2_1 = Admin::MenuItem.create(title: "Реєстр методичних рекомендацій, інформаційних листів (ІАЦМС)", type_level: "Перший рівень", type_item: "Бокове меню",
                     parent_id: r_m2.id, link: "", show: true, order_item: 1)
r_m2_2 = Admin::MenuItem.create(title: "Інформаційний бюлетень", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m2.id, link: "http://www.amnu.gov.ua/index.php?p=articles&action=displayarticle&id=83", show: true, order_item: 2)

r_m3 = Admin::MenuItem.create(title: "Акредитація закладів охорони здоров'я", type_level: "Заголовок меню", type_item: "Бокове меню",
                       parent_id: 0, link: "", show: true, order_item: 3)
r_m3_1 = Admin::MenuItem.create(title: "Нормативна база", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m3.id, link: "", show: true, order_item: 1)
r_m3_2 = Admin::MenuItem.create(title: "Плани та виконання", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m3.id, link: "", show: true, order_item: 2)

r_m4 = Admin::MenuItem.create(title: "Державні закупівлі", type_level: "Заголовок меню", type_item: "Бокове меню",
                       parent_id: 0, link: "#", show: true, order_item: 4)
r_m4_1 = Admin::MenuItem.create(title: "2014 рік", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m4.id, link: "#", show: true, order_item: 1)
r_m4_2 = Admin::MenuItem.create(title: "2015 рік", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m4.id, link: "#", show: true, order_item: 2)
r_m4_3 = Admin::MenuItem.create(title: "Перелік закуплених лікарських засобів ДПЗ", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m4.id, link: "#", show: true, order_item: 3)
r_m4_4 = Admin::MenuItem.create(title: "Забезпеченість за кошти державного бюджету", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m4.id, link: "#", show: true, order_item: 4)
r_m4_5 = Admin::MenuItem.create(title: "Забезпеченість за іншими джерелами фінансування", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m4.id, link: "#", show: true, order_item: 5)

r_m5 = Admin::MenuItem.create(title: "Бібліотека", type_level: "Пункт меню", type_item: "Бокове меню",
                       parent_id: 0, link: "http://vinmedlib.org.ua/", show: true, order_item: 5)

r_m6 = Admin::MenuItem.create(title: "Про створення ЄСЕМД в області", type_level: "Пункт меню", type_item: "Бокове меню",
                       parent_id: 0, link: "http://www.content.net.ua/registration/index.php?id=5915", show: true, order_item: 6)

r_m7 = Admin::MenuItem.create(title: "Національна лінія телефону довіри", type_level: "Заголовок меню", type_item: "Бокове меню",
                       parent_id: 0, link: "#", show: true, order_item: 7)
r_m7_1 = Admin::MenuItem.create(title: "ВІЛ/СНІД", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m7.id, link: "http://aidscenter.org/", show: true, order_item: 1)
r_m7_2 = Admin::MenuItem.create(title: "Електронна приймальня для пацієнтів", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m7.id, link: "http://dssz.gov.ua/index.php/?option=com_content&view=article&id=1551:sendform&catid=475:othe", show: true, order_item: 2)

r_m8 = Admin::MenuItem.create(title: "Волонтерство", type_level: "Заголовок меню", type_item: "Бокове меню",
                       parent_id: 0, link: "#", show: true, order_item: 8)
r_m8_1 = Admin::MenuItem.create(title: "Допомога учасникам бойових дій", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m8.id, link: "http://aidscenter.org/", show: true, order_item: 1)
r_m8_2 = Admin::MenuItem.create(title: "Волонтерські організації", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m8.id, link: "#", show: true, order_item: 2)
r_m8_3 = Admin::MenuItem.create(title: "Благодійність", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m8.id, link: "#", show: false, order_item: 3)

r_m9 = Admin::MenuItem.create(title: "Соціальні проекти", type_level: "Пункт меню", type_item: "Бокове меню",
                       parent_id: 0, link: "http://www.content.net.ua/registration/index.php?id=5915", show: true, order_item: 9)

r_m10 = Admin::MenuItem.create(title: "Фотоматеріали", type_level: "Пункт меню", type_item: "Бокове меню",
                       parent_id: 0, link: "http://www.content.net.ua/registration/index.php?id=5915", show: true, order_item: 10)

r_m11 = Admin::MenuItem.create(title: "Відеоматеріали", type_level: "Пункт меню", type_item: "Бокове меню",
                       parent_id: 0, link: "http://www.content.net.ua/registration/index.php?id=5915", show: true, order_item: 11)

r_m12 = Admin::MenuItem.create(title: "Гаряча лінія", type_level: "Заголовок меню", type_item: "Бокове меню",
                       parent_id: 0, link: "#", show: true, order_item: 12)
r_m12_1 = Admin::MenuItem.create(title: "Он-лайн допомога", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m12.id, link: "#", show: true, order_item: 1)
r_m12_2 = Admin::MenuItem.create(title: "Цілодобова телефонна допомога", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m12.id, link: "#", show: true, order_item: 2)
r_m12_3 = Admin::MenuItem.create(title: "Телефон довіри", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m12.id, link: "#", show: true, order_item: 3)
r_m12_4 = Admin::MenuItem.create(title: "Гаряча лінія з питань реформування охорони здоров`я", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m12.id, link: "#", show: true, order_item: 4)
r_m12_5 = Admin::MenuItem.create(title: "Гаряча лінія З метою забезпечення оперативного реагування на звернення громадян в МОЗ", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m12.id, link: "#", show: true, order_item: 5)
r_m12_6 = Admin::MenuItem.create(title: "Гаряча лінія з питань роботи екстреної медичної допомоги та медицини катастроф", type_level: "Перший рівень", type_item: "Бокове меню",
                          parent_id: r_m12.id, link: "#", show: true, order_item: 6)
r_m12_7 = Admin::MenuItem.create(title: "Гаряча лінія «АНТИ-ГРИП»", type_level: "Перший рівень", type_item: "Бокове меню",
                          parent_id: r_m12.id, link: "#", show: true, order_item: 7)
r_m12_8 = Admin::MenuItem.create(title: "Прес-центр", type_level: "Перший рівень", type_item: "Бокове меню",
                          parent_id: r_m12.id, link: "#", show: true, order_item: 8)
r_m12_8_1 = Admin::MenuItem.create(title: "Повідомлення та заяви", type_level: "Додатковий рівень", type_item: "Бокове меню",
                      parent_id: r_m12_8.id, link: "http://aidscenter.org/", show: true, order_item: 1)
r_m12_8_2 = Admin::MenuItem.create(title: "Реагування на критику", type_level: "Додатковий рівень", type_item: "Бокове меню",
                      parent_id: r_m12_8.id, link: "http://aidscenter.org/", show: true, order_item: 2)
r_m12_8_2 = Admin::MenuItem.create(title: "Форма та порядок подання", type_level: "Додатковий рівень", type_item: "Бокове меню",
                      parent_id: r_m12_8.id, link: "http://aidscenter.org/", show: true, order_item: 3)
r_m12_9 = Admin::MenuItem.create(title: "Звернення громадян.  Інформаційний куточок", type_level: "Перший рівень", type_item: "Бокове меню",
                          parent_id: r_m12.id, link: "#", show: true, order_item: 9)

r_m13 = Admin::MenuItem.create(title: "Здоровий спосіб життя", type_level: "Заголовок меню", type_item: "Бокове меню",
                       parent_id: 0, link: "#", show: true, order_item: 13)
r_m13_1 = Admin::MenuItem.create(title: "Здорове життя (бюлетені, Пам'ятка для тих, хто здійснює санітарно-просвітницьку роботу)", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m13.id, link: "http://aidscenter.org/", show: true, order_item: 1)
r_m13_2 = Admin::MenuItem.create(title: "Блок громадського здоров’я", type_level: "Перший рівень", type_item: "Бокове меню",
                         parent_id: r_m13.id, link: "http://dssz.gov.ua/index.php/?option=com_content&view=article&id=1551:sendform&catid=475:othe", show: true, order_item: 2)


r_m14 = Admin::MenuItem.create(title: "Публічна інформація", type_level: "Пункт меню", type_item: "Бокове меню",
                       parent_id: 0, link: "#", show: true, order_item: 14)

r_m15 = Admin::MenuItem.create(title: "Державно-приватне партнерство", type_level: "Пункт меню", type_item: "Бокове меню",
                       parent_id: 0, link: "#", show: true, order_item: 15)










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
# MedicalSetupCategory.delete_all
# msc1 = MedicalSetupCategory.create(name: "First category L1", type_category: "Location")
# msc2 = MedicalSetupCategory.create(name: "First category L2", type_category: "Location")
# msc3 = MedicalSetupCategory.create(name: "First category L3", type_category: "Location")
# msc4 = MedicalSetupCategory.create(name: "Second category", type_category: "Other")
# msc5 = MedicalSetupCategory.create(name: "Third category", type_category: "Study")
#
# MedicalSetup.delete_all
# ms1 = MedicalSetup.create(name: "Перший заклад 1 Location", address: "Апдреса перша 1", phone: "111 111 111",
#                           head_doctor: "Першиий Голова", email: "f111@g.com", category_level: "1", site_address: "http://www.cyberforum.ru/",
#                           medical_setup_category_id: msc1.id )
# ms2 = MedicalSetup.create(name: "Перший заклад 2 Location", address: "Апдреса перша 1", phone: "111 111 111",
#                           head_doctor: "Першиий Голова", email: "f111@g.com", category_level: "1", site_address: "http://www.cyberforum.ru/",
#                           medical_setup_category_id: msc2.id )
# ms3 = MedicalSetup.create(name: "Перший заклад 3 Location", address: "Апдреса перша 1", phone: "111 111 111",
#                           head_doctor: "Першиий Голова", email: "f111@g.com", category_level: "1", site_address: "http://www.cyberforum.ru/",
#                           medical_setup_category_id: msc3.id )
# ms4 = MedicalSetup.create(name: "Перший заклад 1", address: "Апдреса перша 1", phone: "111 111 111",
#                           head_doctor: "Першиий Голова", email: "f111@g.com", category_level: "1", site_address: "http://www.cyberforum.ru/",
#                           medical_setup_category_id: msc3.id )
# ms5 = MedicalSetup.create(name: "Перший заклад 1 Other", address: "Апдреса перша 1", phone: "111 111 111",
#                           head_doctor: "Першиий Голова", email: "f111@g.com", category_level: "1", site_address: "http://www.cyberforum.ru/",
#                           medical_setup_category_id: msc4.id )
# ms6 = MedicalSetup.create(name: "Перший заклад 1 Study", address: "Апдреса перша 1", phone: "111 111 111",
#                           head_doctor: "Першиий Голова", email: "f111@g.com", category_level: "1", site_address: "http://www.cyberforum.ru/",
#                           medical_setup_category_id: msc5.id )
#
# t1 = Time.now.strftime('%F')
# t2 = Time.now.change(year: 2018).strftime('%F')
#
# MedicalSetupLicense.delete_all
# msl1 = MedicalSetupLicense.create(date_start: t1, date_finish: t2, number_license: "AB 237194", medical_setup_id: ms1.id )
# msl2 = MedicalSetupLicense.create(date_start: t1, date_finish: t2, number_license: "AB 237194", medical_setup_id: ms2.id )
# msl3 = MedicalSetupLicense.create(date_start: t1, date_finish: t2, number_license: "AB 237194", medical_setup_id: ms3.id )
# msl4 = MedicalSetupLicense.create(date_start: t1, date_finish: t2, number_license: "AB 237194", medical_setup_id: ms4.id )
# msl5 = MedicalSetupLicense.create(date_start: t1, date_finish: t2, number_license: "AB 237194", medical_setup_id: ms5.id )
# msl6 = MedicalSetupLicense.create(date_start: t2, date_finish: t1, number_license: "AB 237194", medical_setup_id: ms6.id )