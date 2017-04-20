Rails.application.routes.draw do

  namespace :admin do
    resources :statistic_galleries
  end
  namespace :admin do
    resources :people_files
  end
  DynamicRouter.load

  mount Ckeditor::Engine => '/ckeditor'

  post 'message' => 'message#create' , as: :message

  post 'reply' => 'polls#get_reply', as: :reply
  get 'polls_chart/:id' => 'polls#show_chart', as: :polls_chart

  get 'groups/:title_group' => 'articles#show_articles_group'
  get 'groups/:title_group/:title_article' => 'articles#show_groups_article'

  get 'home/index' => 'home#index'

  get '/videos/', to: 'videos#all_videos'
  get '/videos/:id', to: 'videos#show_one_video', as: :show_one_video

  get '/search' => 'search#search', as: :search
  get '/news/', to: 'news#all_news',  as: :all_public_news
  get '/news/:id', to: 'news#show_one_news', as: :show_one_news
  get '/managers_news/' => 'news#all_managers_news',  as: :all_managers_news
  get '/managers_news/:id' => 'news#show_one_managers_news',  as: :show_one_managers_news

  get '/medical_setups/:medical_setups_group' => 'medical_setups#medical_setups'
  get '/private_medical_setups' => 'medical_setups#private_medical_setups'


  get '/statistic' => 'gallery#statistic_galleries', as: :statistic_galleries
  get '/statistic/:gallery' => 'gallery#show_statistic_gallery', as: :statistic_gallery

  get '/photo_galleries' => 'gallery#photo_galleries', as: :photo_galleries
  get '/photo_galleries/:id' => 'gallery#show_photo_gallery', as: :photo_gallery

  get '/documents/:file_document_category' => 'file_documents#category_file_documents', as: :file_document_category

  get '/population_materials' => 'people_files#population_materials', as: :population_materials
  get '/population_materials/:id' => 'people_files#show_population_material', as: :population_material

  namespace :admin do
    controller :sessions do
      get  'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
      get 'successful_login' => :successful_login
    end

    resources :polls do
      resources :replies
    end

    resources :photo_galleries do
      resources :photos do
        put :sort, on: :collection
      end
    end

    resources :users
    resources :roles
    resources :news
    resources :managers_news
    resources :videos
    resources :menu_items
    resources :articles
    resources :articles_groups
    resources :medical_setups
    resources :medical_setups_groups, exept: :show
    resources :private_medical_setups
    resources :files
    resources :file_documents
    get '/documents/:file_document_category' => 'file_documents#index', as: :file_document_category
    get '/file_documents/new/:file_document_category_id' => 'file_documents#new', as: :new_file_document
    resources :file_document_categories
  end

  root 'home#index'

  get "sitemap.xml" => "home#sitemap", :format => "xml", :as => :sitemap

  # get 'news/' => 'news#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # -- Create dinamic routes for articles( item_menu -> article )
  # @links = MenuItem.get_alias_links
  # @links.each do |link|
  #   get "/#{link.alias}.html", :to => "home#show_article", as: 'menu_item_'+link.alias, defaults: { id: link.id_post }
  # end


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
