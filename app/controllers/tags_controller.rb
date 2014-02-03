class TagsController < InheritedResources::Base
  load_and_authorize_resource
  def permitted_params
    params.permit(tag: [:name])
  end
  def show
    @posts = @tag.posts
    super
  end
end
