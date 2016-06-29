class PeopleFilesController < ApplicationController

  def population_materials
    @population_materials = Admin::PeopleFile.where(publish_on: true).order(created_at: :desc).page(params[:page]).per(20)
  end

  def show_population_material
    @population_material = Admin::PeopleFile.find(params[:id])
  end
end