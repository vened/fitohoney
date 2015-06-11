Rails.application.routes.draw do

  namespace :staff do
    get 'dashboard/show', path: '/'
    resources :brands
    resources :feedbacks
    resources :posts
    resources :categories
    resources :carousels
    resources :orders do
      delete 'cart_item_delete/:item_id' => 'orders#cart_item_delete', as: 'item_delete'
    end
    resources :products do
      get 'photos' => 'product_photos#show_product_photos'
      post 'photos' => 'product_photos#upload_product_photo'
      delete 'photos/:photo_id' => 'product_photos#destroy_product_photo'
    end
    namespace :api, defaults: { format: :json } do
      # свойства товара
      resources :properties, :only => [:create]
      delete 'properties/:property_id/:product_id' => 'properties#destroy', as: 'property_destroy'
      get 'properties/product/:product_id' => 'properties#all', as: 'properties_product'
    end
    # root 'dashboard/show'
  end

  devise_for :admins

  namespace :api do
    # фильтры по товарам
    get '/filters' => 'filters#filters'
    get '/filtering' => 'filters#filtering'
  end


  # pages
  root 'pages#home'
  get '/about' => 'pages#about'
  get '/delivery' => 'pages#delivery'
  get '/contacts' => 'pages#contacts'
  get '/sitemap' => 'pages#sitemap'
  
  # rss
  get "/feed", :to => "posts#feed", format: 'rss'


  resources :feedbacks, only: [:index, :show]
  get '/catalog' => 'products#index', as: 'catalog'
  # get '/catalog/:product_path' => 'products#show'
  get '/catalog/:product_path' => 'products#show', as: 'product'
  resources :orders, only: [:show, :create]
  get '/api/mini_cart' => 'orders#mini_cart'
  get '/api/cart_item_inc' => 'orders#cart_item_inc'
  put '/api/orders/:id' => 'orders#update', as: 'api_order_update'
  delete '/api/cart_item_delete' => 'orders#cart_item_delete'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
