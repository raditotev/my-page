class Comment < ActiveRecord::Base
  before_create :set_author
  belongs_to :post

  validates :content, presence: true

  private

  def set_author
    self.author = "Anonymous" if self.author == ""
  end
end
