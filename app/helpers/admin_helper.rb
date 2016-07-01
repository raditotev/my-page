module AdminHelper
  def generate_comments_text count
    case count
    when 0
      "There are no new comments."
    when 1
      "There is 1 new comment."
    else
      "There are #{count} new comments."
    end
  end
end
