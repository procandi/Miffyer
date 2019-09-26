Rails.application.routes.draw do
  resources :arrivals
  get 'arrival/list' => 'arrivals#list'
  post 'arrival/list' => 'arrivals#list'
  get 'arrival/unitlist' => 'arrivals#unitlist'
  post 'arrival/unitlist' => 'arrivals#unitlist'
  get 'arrival/query' => 'arrivals#query'
  post 'arrival/query' => 'arrivals#query'
  get 'arrival/result' => 'arrivals#result'
  post 'arrival/result' => 'arrivals#result'


  resources :pt_barcodes
  get 'pt_barcode/search' => 'pt_barcodes#search'
  post 'pt_barcode/search' => 'pt_barcodes#search'

  resources :us_barcodes
  get 'us_barcode/search' => 'us_barcodes#search'
  post 'us_barcode/search' => 'us_barcodes#search'
  get 'us_barcodes/site_current_uid/:id' => 'us_barcodes#site_current_uid', as: 'us_barcodes/site_current_uid'

  resources :holidays
  resources :works


  resources :schedules
  get 'schedule/editpage/:id' => 'schedules#editpage', as: 'schedules/editpage'  #need sort get id before no get id url, system will use get id route first. @xieyinghua
  get 'schedule/editpage' => 'schedules#editpage'
  post 'schedule/editpage' => 'schedules#editpage'
  get 'schedule/updatepage' => 'schedules#updatepage'
  post 'schedule/updatepage' => 'schedules#updatepage'

  get 'schedule/editrole/:id' => 'schedules#editrole', as: 'schedules/editrole'  #need sort get id before no get id url, system will use get id route first. @xieyinghua
  get 'schedule/editrole' => 'schedules#editrole'
  post 'schedule/editrole' => 'schedules#editrole'
  get 'schedule/updaterole' => 'schedules#updaterole'
  post 'schedule/updaterole' => 'schedules#updaterole'

  resources :wk_barcodes
  get 'wk_barcode/search' => 'wk_barcodes#search'
  post 'wk_barcode/search' => 'wk_barcodes#search'

  resources :rf_barcodes
  get 'rf_barcode/search' => 'rf_barcodes#search'
  post 'rf_barcode/search' => 'rf_barcodes#search'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root to:'root#home'
  get 'test' => 'root#test'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  # first in first out endo. @xieyinghua


  
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :users
  resources :patients
  resources :sites
  resource :session, only: [ :new, :create, :destroy ]

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

  # webservice soap. @xieyinghua
  #wash_out :rfid
end
