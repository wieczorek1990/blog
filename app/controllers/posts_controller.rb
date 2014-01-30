class PostsController < InheritedResources::Base
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
end
