Rails.application.routes.draw do

  DynamicRouter.load

  mount Ckeditor::Engine => '/ckeditor'
  # resources :users, path: "/admin/users"
  # resources :roles, path: "/admin/roles"


  post 'message' => 'message#create' , as: :message
  post 'reply' => 'interrogation#get_reply', as: :reply
  get 'polls_chart/:id' => 'interrogation#show_chart', as: :polls_chart
  # get 'polls_chart/:id' => 'home#show_chart', as: :polls_chart

  get 'groups/:title_group' => 'articles#show_articles_group'
  get 'groups/:title_group/:title_article' => 'articles#show_article'

  get 'home/index' => 'home#index'
  get '/news/', to: 'home#all_news'
  get '/news/:id', to: 'home#show_one_news', as: :show_one_news

  get '/medical_setups' => 'medical_setups#index'
  get '/private_medical_setups' => 'medical_setups#show_private_ms'


  get '/statistic' => 'gallery#galleries', as: :galleries
  get '/statistic/:gallery' => 'gallery#show', as: :gallery

  get '/schedule' => 'home#schedule', as: :schedule
  get '/structure' => 'home#structure', as: :structure

  namespace :admin do
    controller :sessions do
      get  'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
    end
    # resources :users1
    # get 'signup'  => 'users1#new'
    # get 'news/' => 'news#index'
    resources :polls do
      resources :replies
    end
    resources :news
    resources :users
    resources :roles
    resources :menu_items
    resources :articles
    resources :articles_groups
    resources :medical_setups
    resources :medical_setups_groups, exept: :show
    resources :private_medical_setups
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
