ActionController::Routing::Routes.draw do |map|
  map.resources 'users'
  map.resources 'episodes'
  map.resources 'movies'
  map.resources 'media', :singular => 'media_instance'

  map.home '/', :controller => 'home', :action => 'index'

  map.resource :session
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.register '/register', :controller => 'users', :action => 'create'
end
