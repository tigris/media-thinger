ActionController::Routing::Routes.draw do |map|
  map.resources 'users'
  map.resources 'episodes'
  map.resources 'movies'

  map.home '/', :controller => 'home', :action => 'index'

  map.resource :sessions
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login '/login', :controller => 'session', :action => 'new'
  map.logout '/logout', :controller => 'session', :action => 'destroy'
  map.register '/register', :controller => 'users', :action => 'create'
end
