class MoviesController < ApplicationController
  before_filter :login_required
end
