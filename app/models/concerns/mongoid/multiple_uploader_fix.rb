module Mongoid::MultipleUploaderFix
  extend ActiveSupport::Concern

  def resave_files(field_name)
    # this function resave files
    # return model with resaved files
    # be careful this function skip validations
    field_name_to_sym = field_name.to_sym
    self[field_name_to_sym] ||= []
    tmp = self[field_name_to_sym]

    self.send(field_name_to_sym).each do |image|
      filename = image.file.original_filename
      unless tmp.include?(filename)
        image.store!
        tmp << filename
      end
    end
    self.set(field_name => tmp)
  end

  def remove_files_by_name!(field_name, filename)
    # this function remove file from multiple uploaders
    # return model if removed was successfull
    # in other case return nil
    # be careful this function skip validations
    if self[field_name].include? filename
      uploader = self.send(field_name.to_sym).find{|uploaded_file| uploaded_file.file.filename == filename }
      if uploader.remove!
        self[field_name].delete filename
        self.set(field_name => self[field_name])
        # self.class.unscoped.find(self.id)
      end
    end
  end

end