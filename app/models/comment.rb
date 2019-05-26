class Comment < ApplicationRecord
  before_create :set_author
  belongs_to :post

  validates :content, presence: true

  default_scope -> { order(created_at: :desc) }

  private

  def set_author
    self.author = "Anonymous" if self.author == ""
  end
end
