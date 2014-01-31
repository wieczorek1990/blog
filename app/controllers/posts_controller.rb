class PostsController < InheritedResources::Base
  load_and_authorize_resource
  def permitted_params
    params.permit(post: [:title, :content])
  end
  def index
    query = query(params)
    @posts = Post.search query, fields: [{title: :text_start}]
  end
  def autocomplete
    query = query(params)
    render json: Post.search(query, fields: [{title: :text_start}], limit: 10).map(&:title)
  end
  def query(params)
    Post.reindex
    query = params[:query]
    query = '*' if query.to_s.empty?
    return query
  end
end
