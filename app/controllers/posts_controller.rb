class PostsController < InheritedResources::Base
  load_and_authorize_resource
  after_action :update_tags, only: [:create, :update]
  def update_tags
    if params.has_key? :id
      post = Post.find(params[:id])
      post.tags.clear
      params[:post][:tags].each do |tag_id|
        unless tag_id.empty?
          tag = Tag.find(tag_id)
          unless post.tags.include? tag
            post.tags << tag
          end
        end
      end
    end
  end
  def permitted_params
    params.permit(post: [:title, :content])
  end
  def index
    query = query(params)
    @posts = Post.search query, { fields: [{title: :text_start}], page: params[:page], per_page: 10}
  end
  def autocomplete
    query = query(params)
    render json: Post.search(query, fields: [{title: :text_start}], limit: 10).map(&:title)
  end
  def query(params)
    Post.reindex
    if params.has_key? :query
      query = params[:query]
    else
      query = '*'
    end
    return query
  end
end
