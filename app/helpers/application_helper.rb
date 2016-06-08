module ApplicationHelper
  def get_first_sentence text
    text.split('.').first + "."
  end
end
