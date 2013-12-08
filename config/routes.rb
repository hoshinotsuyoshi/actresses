ActressApp::Application.routes.draw do
  resources :tags

  resources :photos

  resources :actresses

  #top page
  root :to=>"actresses#index_photos"

  #site_map
  get '/sitemap' => 'actresses#sitemap'

  #photo page
  get '/actress/image/:name/:id' => 'photos#show_a_photo', as: :actress_photo

  #get '/actress/:name' => 'actresses#show_photos'
  get '/actress/:name' => 'actresses#show_photos', as: :actress_name
  get '/tag/:name' => 'tags#show_photos', as: :tag_name

  #get '/admi' => 'actresses#admin'
  get '/admi' => 'actresses#admin'

  post '/regist_similar' => 'actresses#similar'
  post '/regist_tag' => 'actresses#tag'

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
