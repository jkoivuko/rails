ActionController::Routing::Routes.draw do |map|
  map.resources :instances
  map.resources :sessions

  map.signup '/signup', :controller => 'users',   :action => 'new'
  map.login  '/login',  :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

  #map.resources :courses
  map.resources :users
  map.resources :course_feedbacks
  
  #map.resources :users do |users|
  #     users.resources :profile, :shallow => true
  #     users.resources :friends
  #end
  map.user_profile 'users/:id/profile', :controller => 'users', :action => 'profile', 
  :conditions => { :method => :get }
  
  
  map.resources :courses, :has_many => {:instances => :course_feedbacks} #, :shallow => true
  
  map.register 'exercisegroups/:id/register', :controller => 'registrations', :action => 'new', 
  :conditions => { :method => :post }
  
  map.register_sendmail 'exercisegroups/:id/sendmail', :controller => 'registrations', :action => 'sendmail' #, :conditions => { :method => :post }
  
  # admin scaffold
   map.namespace :admin do |admin| 
       admin.resources :users,    :active_scaffold => true, :has_many => [:roles, :registrations]  
       admin.resources :courses,  :active_scaffold => true, :has_many => [:instances]
       admin.resources :instances, :active_scaffold => true, :has_many => [:exercisegroups]
       admin.resources :exercisegroups, :active_scaffold => true, :has_many => [:registrations]
       admin.resources :roles, :active_scaffold => true
       
  end
  

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
  map.root :controller => "courses"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
