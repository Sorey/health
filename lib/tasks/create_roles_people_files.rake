namespace :create_roles_people_files do
  task :create_roles_manager_sav => :environment do

    a_r_manager_sav = Admin::Role.find_by(title: "manager_sav")

    a_r_people_file = Admin::Role.create(title: "people_files", type_role: 0, parent_id: a_r_manager_sav.id)
    a_r_people_file_1 = Admin::Role.create(title: "admin/people_filesindex", type_role: 1, parent_id: a_r_people_file.id)
    a_r_people_file_2 = Admin::Role.create(title: "admin/people_filesshow", type_role: 1, parent_id: a_r_people_file.id)
    a_r_people_file_3 = Admin::Role.create(title: "admin/people_filesnew", type_role: 1, parent_id: a_r_people_file.id)
    a_r_people_file_4 = Admin::Role.create(title: "admin/people_filescreate", type_role: 1, parent_id: a_r_people_file.id)
    a_r_people_file_5 = Admin::Role.create(title: "admin/people_filesedit", type_role: 1, parent_id: a_r_people_file.id)
    a_r_people_file_6 = Admin::Role.create(title: "admin/people_filesupdate", type_role: 1, parent_id: a_r_people_file.id)
    a_r_people_file_7 = Admin::Role.create(title: "admin/people_filesdestroy", type_role: 1, parent_id: a_r_people_file.id)

    puts "Roles for ManagerSav Created"
  end
end