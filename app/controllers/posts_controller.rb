class PostsController < InheritedResources::Base
  def permitted_params
    params.permit(post: [:title, :content])
  end
end
