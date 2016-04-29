class SearchController < ApplicationController
  def search
    #-- Create Indexes in solr/default (rake create_search_indexes:create_solr_indexes)
    # Sunspot.index(Admin::News.all)
    # Sunspot.index(Admin::Video.all)
    abort Admin::ArticlesGroup.find_by(title_english: 'regional_programs').inspect
    unless params[:search].blank?
      @search = Sunspot.search(Admin::News, Admin::Video)  do
        fulltext params[:search]
        with(:publish_on , true)
        order_by(:created_at, :desc)
        paginate(:page => params[:page] || 1, :per_page => 10)
      end
      @count = @search.total
      @results = @search.results
    end
  end
end