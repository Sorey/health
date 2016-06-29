namespace :create_file_document_categories do
  task :file_document_categories => :environment do

    Admin::FileDocumentCategory.delete_all
    a_f_d_category_1 = Admin::FileDocumentCategory.create(title: "Нормативна база для приватних медичних установ",
                                                          url_title: "file_private_medical_setups")
    a_f_d_category_2 = Admin::FileDocumentCategory.create(title: "Рішення засідань колегії ДОЗ",
                                                          url_title: "decisions_board_meeting")
    a_f_d_category_3 = Admin::FileDocumentCategory.create(title: "Накази ДОЗ",
                                                          url_title: "department_health_decrees")

    puts "FileDocumentCategories Created"
  end
end