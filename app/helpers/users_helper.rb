module UsersHelper
  def has_posts_or_comments?
    return true if current_user && (current_user.posts.count >0 || current_user.comments.count > 0)
    return false
  end
end
