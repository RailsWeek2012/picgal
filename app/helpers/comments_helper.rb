module CommentsHelper
  def is_owner_or_author?(comment)
    return true if current_user == comment.user
    return comment.commentable_type == User.to_s && comment.commentable == current_user
  end
end
