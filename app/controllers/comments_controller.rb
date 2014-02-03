class CommentsController < InheritedResources::Base
  def permitted_params
    params.permit(comment: [:commenter_id, :content, :post_id])
  end
  def create
    super
    @comment.commenter = current_user
    @comment.post_id = params[:post_id]
    @comment.save
  end
  def edit
    @post = Post.find(params[:post_id])
    super
  end
end
