Brazil2014::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'games#index'

  # Authentication
  get  'auth/twitter/callback', to: 'sessions#create'
  get  'auth/failure',        to: redirect('/')  
  get  'signout',             to: 'sessions#destroy', as: 'signout'
  get  'auth/twitter',                                as: 'signin'

  get  'players',             to: 'players#index',    as: 'players'

  post 'games/:game_id/performance_records/:performance_record_id/ratings/', to: 'ratings#create', as: 'game_performance_record_ratings'

  get  'users/:id/ratings/',  to: 'ratings#index',    as: 'user_ratings'
  resources :teams do
    resources :players, except: :index
  end

  resources :games do
    resources :performance_records, only: [:new, :create, :destroy]
  end

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
