module ApplicationHelper
  def get_first_paragraph text
    strip_tags(text.split('</p>').first )
  end
end
