class DynamicRouter
  def self.load
    Rails.application.routes.draw do
      @links = Admin::MenuItem.get_alias_links
      # @links.each do |link|
      #   abort link.inspect
      #   # puts "Routing #{link.alias}"
      #   # get "/#{link.alias}.html", :to => "home#show_article", as: 'menu_item_'+link.alias, defaults: { id: link.id_post.to_s }
      # end

      if @links
        @links.each do |link|
          puts "Routing -  #{link.alias}"
          get "/#{link.alias}.html", :to => "home#show_article", as: 'menu_item_'+link.alias, defaults: { id: link.id_post.to_s }

        end
      end
    end
    #
    # Rails.application.routes.draw do
    #   Page.all.each do |pg|
    #     puts "Routing #{pg.name}"
    #     get "/#{pg.name}", :to => "pages#show", defaults: { id: pg.id }
    #   end
    # end
  end

  def self.reload
    Rails.application.routes_reloader.reload!
  end
end