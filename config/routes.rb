Rails.application.routes.draw do

  DynamicRouter.load

  mount Ckeditor::Engine => '/ckeditor'
  # resources :articles_groups, path: "/admin/articles_groups"
  # resources :articles, path: "/admin/articles"
  # resources :menu_items, path: "/admin/menu_items"
  # resources :users, path: "/admin/users"
  # resources :roles, path: "/admin/roles"
  resources :medical_setups

  get 'home/index' => 'home#index'
  get '/news/', to: 'home#all_news'
  get '/news/:id', to: 'home#show_one_news', as: :show_one_news

  # get '/schedule' => 'home#schedule', as: :schedule
  # get '/structure' => 'home#structure', as: :structure

  namespace :admin do
    controller :sessions do
      get  'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
    end
    # resources :users1
    # get 'signup'  => 'users1#new'
    # get 'news/' => 'news#index'

    resources :news
    resources :users
    resources :roles
    resources :menu_items
    resources :articles
    resources :articles_groups
  end

  root 'home#index'


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
