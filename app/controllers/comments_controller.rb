class CommentsController < InheritedResources::Base
  def permitted_params
    params.permit(comment: [:commenter_id, :content, :post_id])
  end
  def create
    post_id = params[:post_id]
    super { post_path(post_id) }
    @comment.commenter = current_user
    @comment.post_id = post_id
    @comment.save
  end
  def edit
    @post = Post.find(params[:post_id])
    super
  end
  def index
    @comments = Comment.where(post_id: params[:post_id])
  end
end
