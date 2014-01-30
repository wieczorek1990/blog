module PostsHelper
  def facebook_url(post)
    if request.url.end_with? post_path(post)
      request.url
    else
      request.url + post_path(post)
    end
  end
end
