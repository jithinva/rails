ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
 
  map.resources :users,:user_sessions
  map.resources :categories, :collection=>{ :employee_list=>[:get,:post]}
  map.resources :categories ,:has_many=>:commodities
  map.resources :categories ,:has_many=>:intakes
  map.resources :intakes, :collection=>{ :intake=>[:get,:post]}
  map.resources :outflows, :collection=>{ :outflow=>[:get,:post]}
  map.resources :commodities, :collection=>{ :admin_report=>[:get,:post],:employee_report=>[:get,:post],:commodity_details=>[:get,:post],:commodity_date_filter=>[:get,:post]}
  map.resources :commodities,:has_many=>:intakes
  map.resources :commodities,:has_many=>:outflows
  map.logout "logout", :controller => "user_sessions", :action => "destroy"
  map.root :controller=>"user_sessions",:action=>"new"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
