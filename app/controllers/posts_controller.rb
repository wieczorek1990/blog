class PostsController < InheritedResources::Base
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  def permitted_params
    params.permit(post: [:title, :content])
  end
end
