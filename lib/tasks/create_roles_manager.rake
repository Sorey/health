namespace :create_roles_manager do
  task :create_roles_manager_tru_sav => :environment do

    a_r_manager = Admin::Role.find_by(title: "manager")
    a_r_manager_tru = Admin::Role.find_by(title: "manager_tru")
    a_r_manager_sav = Admin::Role.find_by(title: "manager_sav")

    a_r_photo_gallery = Admin::Role.create(title: "photo_galleries", type_role: 0, parent_id: a_r_manager_sav.id)
    a_r_photo_gallery_1 = Admin::Role.create(title: "admin/photo_galleriesindex", type_role: 1, parent_id: a_r_photo_gallery.id)
    a_r_photo_gallery_2 = Admin::Role.create(title: "admin/photo_galleriesshow", type_role: 1, parent_id: a_r_photo_gallery.id)
    a_r_photo_gallery_3 = Admin::Role.create(title: "admin/photo_galleriesnew", type_role: 1, parent_id: a_r_photo_gallery.id)
    a_r_photo_gallery_4 = Admin::Role.create(title: "admin/photo_galleriescreate", type_role: 1, parent_id: a_r_photo_gallery.id)
    a_r_photo_gallery_5 = Admin::Role.create(title: "admin/photo_galleriesedit", type_role: 1, parent_id: a_r_photo_gallery.id)
    a_r_photo_gallery_6 = Admin::Role.create(title: "admin/photo_galleriesupdate", type_role: 1, parent_id: a_r_photo_gallery.id)
    a_r_photo_gallery_7 = Admin::Role.create(title: "admin/photo_galleriesdestroy", type_role: 1, parent_id: a_r_photo_gallery.id)

    a_r_photo = Admin::Role.create(title: "photos", type_role: 0, parent_id: a_r_manager_sav.id)
    a_r_photo_1 = Admin::Role.create(title: "admin/photoscreate", type_role: 1, parent_id: a_r_photo.id)
    a_r_photo_2 = Admin::Role.create(title: "admin/photossort", type_role: 1, parent_id: a_r_photo.id)
    a_r_photo_3 = Admin::Role.create(title: "admin/photosdestroy", type_role: 1, parent_id: a_r_photo.id)

    a_r_file_document_category = Admin::Role.create(title: "file_document_categories", type_role: 0, parent_id: a_r_manager.id)
    a_r_file_document_category_1 = Admin::Role.create(title: "admin/file_document_categoriesindex", type_role: 1, parent_id: a_r_manager_tru.id)
    a_r_file_document_category_2 = Admin::Role.create(title: "admin/file_document_categoriesshow", type_role: 1, parent_id: a_r_file_document_category.id)
    a_r_file_document_category_3 = Admin::Role.create(title: "admin/file_document_categoriesnew", type_role: 1, parent_id: a_r_file_document_category.id)
    a_r_file_document_category_4 = Admin::Role.create(title: "admin/file_document_categoriescreate", type_role: 1, parent_id: a_r_file_document_category.id)
    a_r_file_document_category_5 = Admin::Role.create(title: "admin/file_document_categoriesedit", type_role: 1, parent_id: a_r_file_document_category.id)
    a_r_file_document_category_6 = Admin::Role.create(title: "admin/file_document_categoriesupdate", type_role: 1, parent_id: a_r_file_document_category.id)
    a_r_file_document_category_7 = Admin::Role.create(title: "admin/file_document_categoriesdestroy", type_role: 1, parent_id: a_r_file_document_category.id)

    a_r_file_document = Admin::Role.create(title: "file_documents", type_role: 0, parent_id: a_r_manager_tru.id)
    a_r_file_document_1 = Admin::Role.create(title: "admin/file_documentsindex", type_role: 1, parent_id: a_r_file_document.id)
    a_r_file_document_2 = Admin::Role.create(title: "admin/file_documentsshow", type_role: 1, parent_id: a_r_file_document.id)
    a_r_file_document_3 = Admin::Role.create(title: "admin/file_documentsnew", type_role: 1, parent_id: a_r_file_document.id)
    a_r_file_document_4 = Admin::Role.create(title: "admin/file_documentscreate", type_role: 1, parent_id: a_r_file_document.id)
    a_r_file_document_5 = Admin::Role.create(title: "admin/file_documentsedit", type_role: 1, parent_id: a_r_file_document.id)
    a_r_file_document_6 = Admin::Role.create(title: "admin/file_documentsupdate", type_role: 1, parent_id: a_r_file_document.id)
    a_r_file_document_7 = Admin::Role.create(title: "admin/file_documentsdestroy", type_role: 1, parent_id: a_r_file_document.id)

    puts "Roles for ManagerTru Created"
  end
end
